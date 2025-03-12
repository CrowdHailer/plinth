export function showModal(element) {
    if (!element || !(element instanceof HTMLDialogElement)) return;

    element.showModal();
}

export function closeModal(element) {
    if (!element || !(element instanceof HTMLDialogElement)) return;

    element.close();
}