Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62820C2A09B
	for <linux-i3c@archiver.kernel.org>; Fri,  7 Aug 2026 15:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AKZSKXAjUjNsaL1LZSorAyDgntgHRVQ2RzRO3O96ALQ=; b=SC0RCqWUeGkfM4
	Mgb4w0odaxcP5c1hFF1ex+dSIG5AHeCDip2/MdFCWzk1WnPcr4IWC4frKtYhw5lB0e9jxFrwKuadv
	rA5HSeOqdWdj9jeBKC1FMcWnJ6j3K/bEPv3hRy7/BWePwEiTFBNMGt1e17KBzsb62Ep64OZ7NSgoo
	JSy1DxI78Ib6P+TJt2IWgJt4OpiOQjqpJo1J7+nl0isaAjuPc9zFVIe8inNW8pvdOvQUPwe09zplw
	6JuSD+kHEFqAvWYCws4/kbyUjmWSOaAerPMQHIndq73yTneMai4qnxoQSL/MfByjAMP1oI5P26nmi
	IEmlGaieuf/YaoZ0lxFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMWo-00000008LDM-07L3;
	Fri, 07 Aug 2026 15:30:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMWm-00000008LDE-2R1S
	for linux-i3c@lists.infradead.org;
	Fri, 07 Aug 2026 15:30:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0CD646136F;
	Fri,  7 Aug 2026 15:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 815A41F00A3A;
	Fri,  7 Aug 2026 15:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786116631;
	bh=MiyOrdbfG51/NVuRhXSqYAZoMEpFihXGDHVcJ9LKbqU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KaefTTuelvmlQ20RUxPpz2NOUpReb0aKL0UJyBtisA+3CquZcsak/A9ShoFg+NTif
	 PKXjwToFTURYQAC+7BOcmHRN8GpASPdNZ0+CXVvnRMt3J1vKfKzyL63V9vDqHE/JpM
	 xuDeoOndx54YOdDUzCP5vgMWhY70uuXzbz/DmQH3ga0uF89DI0c3NebO40iMagNSLN
	 c7OLZCJN6rxgdGjc0ImIdlLnYBQN5rTvZX/iIZsJ8zbfvH8nSmOcXSEVnqAkfk0PrE
	 N93wpaGyRMa2VR97pIeiDruIM8dtbdLEMdOYIRII3IhgzaFgnzCT0ZIbhJ6LlalR1G
	 ni+rhRjlCQjJQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V5 14/14] i3c: mipi-i3c-hci: Advertise IBI wakeup
 capability
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: Frank.Li@kernel.org, linux-pci@vger.kernel.org, linux-i3c@lists.infradead.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260807145638.168865-15-adrian.hunter@intel.com>
References: <20260807145638.168865-1-adrian.hunter@intel.com>
 <20260807145638.168865-15-adrian.hunter@intel.com>
Date: Fri, 07 Aug 2026 15:30:31 +0000
Message-Id: <20260807153031.815A41F00A3A@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

PiBTZXQgbWFzdGVyLT5pYmlfd2FrZXVwIGR1cmluZyBwcm9iZSB3aGVuIHRoZSBhc3NvY2lhdGVk
IHN5c3RlbSBkZXZpY2UKPiBhZHZlcnRpc2VzIHdha2V1cCBjYXBhYmlsaXR5LCBhbGxvd2luZyB0
aGUgSTNDIGNvcmUgdG8gbWFyayBJQkktY2FwYWJsZQo+IEkzQyBkZXZpY2VzIGFzIHdha2V1cCBj
YXBhYmxlLgo+IAo+IFR3ZWFrIHRoZSBjb21tZW50IGZvciBpM2NfaGNpX3N5c2RldigpIHRvIG1l
bnRpb24gdGhlIG5ldyB1c2FnZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBZHJpYW4gSHVudGVyIDxh
ZHJpYW4uaHVudGVyQGludGVsLmNvbT4KClNhc2hpa28gaGFzIHJldmlld2VkIHRoaXMgcGF0Y2gg
YW5kIGZvdW5kIG5vIGlzc3Vlcy4gSXQgbG9va3MgZ3JlYXQhCgotLSAKU2FzaGlrbyBBSSByZXZp
ZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwODA3MTQ1NjM4LjE2ODg2
NS0xLWFkcmlhbi5odW50ZXJAaW50ZWwuY29tP3BhcnQ9MTQKCgotLSAKbGludXgtaTNjIG1haWxp
bmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
