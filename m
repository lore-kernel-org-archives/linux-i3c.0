Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB97C43458
	for <linux-i3c@archiver.kernel.org>; Tue, 30 Jun 2026 02:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sJZNdoJikJIo2SyAeEZLZS+51IQW7jt3rb/kemC1PWc=; b=M9u8dh4NDuRAzu
	+1EEJ2Dxy3EH2dqvL6EyPJMIEcDS0RDt+4pfS6qavKJbnZ7IMrJw96bjMdFkNgpaQUj0PDCOfqQ+A
	xy2AUOCFCFCLi7Yvcogvt/GA8T+sTRoY0u6cq0mapKOoA428lShdP+o6btTYsg88YVHsA3vEPkT5x
	9ibktRkkOkA3GSrST5ypSxoww3r18F8KTvMPkfRfZda7sWSs5qjvlpYKLQpQfKmMQ9IUO8wSnUdCt
	IcIE3Cqgq/+w426RAfqwc9Ph6Et5zQoXXp6ZSf+G+Ix4ntLgTJwJJuMeG5LKnGdu8nBjRwyVsd4MC
	GjY95Y8sTtw8ni/TOeJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weO2v-0000000FhMv-23lF;
	Tue, 30 Jun 2026 02:17:57 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weO2s-0000000FhMV-0YAm
	for linux-i3c@lists.infradead.org;
	Tue, 30 Jun 2026 02:17:55 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-7fe36f1be74so47099587b3.2
        for <linux-i3c@lists.infradead.org>; Mon, 29 Jun 2026 19:17:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782785872; cv=none;
        d=google.com; s=arc-20260327;
        b=Kvulo7j5o3Us3MAn7DwFE3zXgv8PxJUlb57JpZ+hHd3kBrL3/pTP8djDlbuxMQk8sd
         UaInF37uiv7F84AclKESF+Vw+p4OeYtlAgjmeSIB9EfFlHpGSrcKqCDST6rh3JSVsvjw
         UqMI4xCEQ/Jxc9To+dyNhfSD4LjIOtFHBDAqGRVl5MgnN/jjX213RCptVCt1QzCYWkBJ
         yyFlJcsXaZP9SDwxlUCMYITe7LL0v7yLBlXDzcwou6A+muOxFvYxEAiRhftyU2DnQcYu
         S2T+OUHYcWQB35faYctt2O/YntrtHeSbsgKJvu1q2UrpUsgqennH52BAmsZ4kBiye33C
         VQXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UgaJA7qj9NC65AcoXJ61r1jbL6fXa0dAK0qTsnGKuEQ=;
        fh=Cia7sWHEgs5+0iVr3W1d8FXB9wVUeQVyad0Yp1UQZeI=;
        b=Chg2ap4736XuK9JHR0k4zgQQcsvRB143kXaPtE4wdcb6zUBkbxBqfKLPgTJaecPY3Z
         AeBzb6qT8gPkjshCty4lKRe9DCjwq9Va5mq9XJ2Cp+AhZaQEqVSU/kIoBvK/H5hAOYu/
         gUaHsjsEHfRQPuQkEQo+E1VShovtPX/LljSh8vJkYBYkSihBE2Ca66QIFpEB3gIwscfH
         /WkjOoDyzbZyWDz0JS3K3jyp1QdBiIkmUymxEA/1VwJBW0Et1gRw5spUQwxn86ct4C8s
         MinTsK2CNwf9a8pazMar7vEaVVBn67tsR/gs823Jf5jUDu6+YzVDqulBKQ9j+fLKU1Yg
         RlKQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782785872; x=1783390672; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UgaJA7qj9NC65AcoXJ61r1jbL6fXa0dAK0qTsnGKuEQ=;
        b=l7kvMK78cuvbg0WupHj/3b109og89reOib+QDTMDfZEhCN9sdboT9zZpfv3eWahbDB
         iDVTVi08U/V636U+zF57mFOyzC/0L3K5KdLh2pcqV8jbtAx7q4dTT/d8nurntp7VxE0I
         lbvehut0k7fUg4PKRe7kV2IjcUOgfSoJXHOl26pVO+thTDNTorY+99Be1PEGqbf1KYZN
         dBIkFLdMIBg8UrN8PZLBL86Do0QluhtgxX1qbV2vO5qUq8ftVhzsAFsN0bFclZWIYlXg
         qQnnRgt2AJpE6cbY9JFiSUKcY7PHrR2Oyv8W0x5YrlI0MUkpdQ1kpJQ6nbE3rs7cg0+C
         emVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782785872; x=1783390672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UgaJA7qj9NC65AcoXJ61r1jbL6fXa0dAK0qTsnGKuEQ=;
        b=KHsK/fyDiPDVvXkLV+lVjq+WYI/soauGrnenHFrWNqMUrM7DlmxPCgfM9tOzOGx3+K
         JTzdn83Rou6svKuOr+x+0b7X6uuRSe/tW7yl7qXQwPR1dzRieA6Sqt66K8I6TkA+vlp/
         TIy7IBc5QQsHVjnP6080mQX9GJvInZktnh2aHNPOe/5sR3eB+DidJR1Ix6rJyXYkTJX4
         xD63nASAASwoIXSgdZf0XFn4TE0pXg1WjZyXYbPOPsu/lpGyAtt/jPvSvH3XFbSeLDXL
         gv2ls/W42sICH9daW5RfUzm/CWjy6kemJi9PfY6k1JgwaaYcfX3KSL8Oc/dx5m2+jz69
         pW7g==
X-Gm-Message-State: AOJu0YzAMn0EZlxdIo8m73Xul1JutrrquKqF3tKhpOl6LEVc+vLe/2Js
	xbc5f2myTfhxUwD0m6WOEqF79P+LFxRNK6PvioNSR6+kUzTJ+jTSU0tx+5Dw7FcQQ/qClArSQ+O
	xdxn7CqfEHB2SPqrWrtTkRWLKReitMOMTqLwedCvk
X-Gm-Gg: AfdE7clw9At5tKFSWxgxlkHLJL3pWMqzfwCH1NmGipzrhh9VxIoGg/7kBEymjXz6FJK
	vx2tmVbEf+l02qCSVradXwaFqvbDpy6cvi7pPlo9D8A/bDLOEocZG/UzpH9sr+EL65g0yDdB3Km
	duTX8/bMFa8zbmmPhjsUaXLMk5Jh9CsxacAoMBJVM0c9mhBo3b0ZB/UlwVdSS9hlhCBgGhlkBLF
	/FX/yaDMhUv3tX36hyFljEu4fLKWI3Y1vbeqL7BII/5rKMd9HYiZXpdbWk0rbaPotMsiyk=
X-Received: by 2002:a05:690c:e36c:b0:80c:85b6:75b6 with SMTP id
 00721157ae682-810db2122a3mr18912977b3.63.1782785871352; Mon, 29 Jun 2026
 19:17:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAHreonE1UF=BJjeQH_i0jjAEMBb8OALeTKoxPBcrRwLZWq=p0w@mail.gmail.com>
 <ahG-H3D9P-qGjigB@lizhi-Precision-Tower-5810> <CAHreonFQ1NiROnz4q-zsHhttYumgSxWurkTbZz_Jq5yDFCEt0A@mail.gmail.com>
 <aiBxKRj6Aaw4RodS@lizhi-Precision-Tower-5810>
In-Reply-To: <aiBxKRj6Aaw4RodS@lizhi-Precision-Tower-5810>
From: Sam Agazaryan <samagazaryan@google.com>
Date: Mon, 29 Jun 2026 19:17:40 -0700
X-Gm-Features: AVVi8CecnAsaTCy0OP5aytximP1E7gKKNd8EwU7dYBoRURcumthVu6Yjxn_o4ew
Message-ID: <CAHreonF37QwpDEUPRtyKQVMDQR2eBX59eeVO9CMQTvJnv_u2pg@mail.gmail.com>
Subject: Re: [RFC] mipi-i3c-hci: Support for DMA Ring Pipelining /
 High-throughput Streaming
To: Frank Li <Frank.li@nxp.com>
Cc: linux-i3c@lists.infradead.org, alexandre.belloni@bootlin.com, 
	npitre@baylibre.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_191754_220103_5E98F57D 
X-CRM114-Status: GOOD (  13.48  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKdW4gMywgMjAyNiBhdCAxMToyM+KAr0FNIEZyYW5rIExpIDxGcmFuay5saUBueHAu
Y29tPiB3cm90ZToKCkhleSBGcmFuaywKCkFwb2xvZ2llcyBmb3IgdGhlIGxhdGUgcmVwbHkuCgo+
Cj4gQXNzdW1lIGxlZnQgMTI4IGVudHJ5LCBlYWNoIGVudHJ5IG9ubHkgMSBieXRlLCAgYWJvdXQg
MTI4ICogKDEwICsgOCkncwo+IFNDTCwKPgo+IElmIFNDTCBpcyAxMk0sIG9ubHkgaGF2ZSAxOTJ1
cyB0byBmaWxsIG5ldyBkZXNjcmlwdG9yLiB0aW1lIG9mIHdha2UgdXAgYQo+IHRocmVhZCBtYXkg
YmUgYmlnZ2VyIHRoYW4gdGhpcyB0aW1lLgo+CgpFaXRoZXIgd2F5IGRvbid0IHdlIHN0aWxsIG5l
ZWQgdG8gd2FpdCB0byB3YWtlIHVwIGFmdGVyIGNvbXBsZXRpbmcgYQp0cmFuc2ZlciB3aXRoIHRo
ZSBjdXJyZW50IGRyaXZlcj8gV2l0aCB0aGUgY3VycmVudCBkcml2ZXIgd2Ugd291bGQKanVzdCBy
ZXR1cm4gYmFjayB1cCB0aGUga2VybmVsIHN0YWNrIHRvIHVzZXJzcGFjZSBldmVudHVhbGx5IGlu
c3RlYWQKb2YgcG90ZW50aWFsbHkgcXVldWluZyBtb3JlIHRyYW5zYWN0aW9ucywgRS5HLiAxMjgg
ZW50cmllcyBlYWNoIG9ubHkgMQpieXRlIHF1ZXVlZCBpbiB0aGUgRE1BIHJpbmcgYW5kIHdlIGdv
IHRvIHNsZWVwIHdhaXRpbmcgZm9yIGNvbXBsZXRpb24KKFRPQz0xIGZvciB0aGUgZmluYWwgdHJh
bnNhY3Rpb24pLiBOb3JtYWwgcXVldWUgdXBzIDwgcXVldWUgc2l6ZQpzaG91bGQgdGVjaG5pY2Fs
bHkgbm90IGJlIGltcGFjdGVkLiBPbmUgY2hhbmdlIGluIGJlaGF2aW9yLCBJIGd1ZXNzLAp3b3Vs
ZCBiZSB0aGF0IGlmIG11bHRpcGxlIGNhbGxzIG9jY3VyIHRvIHRoZSBkcml2ZXIgYXQgb25jZSB0
aGV5IHdpbGwKd2FpdCBmb3Igc3BhY2Ugb24gdGhlIHJpbmcgdG8gZG8gdGhlaXIgdHJhbnNmZXJz
IGlmIHRoZSByaW5nIGNhbm5vdAphY2NvbW1vZGF0ZSB0aGUgcmVxdWVzdHMgYXQgdGhhdCBtb21l
bnQuCgpJbiBhbiBleHRyZW1lIGNhc2UsIGxpa2Ugc2VuZGluZyB0aGUgZHJpdmVyIHNheSAxMDI0
IDEtYnl0ZQp0cmFuc2FjdGlvbnMgdG8gcHJvY2VzcywgaXQgaXMgZGVmaW5pdGVseSBwb3NzaWJs
ZSB0aGF0IHRoZSB3aG9sZSByaW5nCmVtcHRpZXMgb3V0IGJlZm9yZSB3ZSBjYW4gcmVmaWxsIGl0
LiBIb3dldmVyLCBJSVVDLCB0aGlzIHNob3VsZCBiZQpva2F5IGFjY29yZGluZyB0byB0aGUgTUlQ
SSBJM0MgSENJIHN0YW5kYXJkIHNpbmNlIHRoZSBoYXJkd2FyZSB3aWxsCmp1c3Qgd2FpdCBmb3Ig
dXMgdG8gbW92ZSB0aGUgZW5xdWV1ZSBwb2ludGVyIGZvcndhcmQgYWdhaW4sIHNpZ25hbGluZwp0
aGF0IG1vcmUgdHJhbnNhY3Rpb25zIGFyZSBhdmFpbGFibGUuIEJlY2F1c2Ugd2UgYWx3YXlzIHRl
cm1pbmF0ZSBlYWNoCmNodW5rIChTb21lIHByb3BvcnRpb24gb2YgdGhlIHJpbmcgZGVwdGgsIHNh
eSAxMjcgaW4gdGhlIGNhc2Ugb2YgYQoyNTUtZW50cnkgcmluZykgd2l0aCBhIFRPQz0xIGRlc2Ny
aXB0b3IsIHRoZSBoYXJkd2FyZSB0cmVhdHMgaXQgYXMgYQpjb21wbGV0ZSBzZXF1ZW5jZS4gVGhl
cmVmb3JlLCBpZiB0aGUgcmluZyBlbXB0aWVzIG91dCBiZWZvcmUgd2UgY2FuCnJlZmlsbCBpdCwg
dGhlIGhhcmR3YXJlIHNpbXBseSBpZGxlcyBncmFjZWZ1bGx5IHVudGlsIHdlIG1vdmUgdGhlCmVu
cXVldWUgcG9pbnRlciBhZ2Fpbi4KClRoYW5rcywKU2FtCgotLSAKbGludXgtaTNjIG1haWxpbmcg
bGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
