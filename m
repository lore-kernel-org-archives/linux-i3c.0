Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63512C0032E
	for <linux-i3c@archiver.kernel.org>; Fri, 20 Oct 2023 13:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mt9y44BtZmchNf/Z4DVA2AvhD+G4tYHhDig92iuet1I=; b=Hr7BwVESGHI4nj
	Ng0KYnKSykmyhwz7T3zCDEZsoHv2HSztzkUfAMMy8rZFz1aAU3NNrIG4UffRJfENyVeRG4EVxkS3p
	tXFHeHp9ylopOEK5Ej3AsQOtv+XquTzzOxybC6Nf4t74SlJLzFXXF1qmVFEw71gSlYhAdp7gz0R0A
	M88tY0mQLbb5lQ0XIu+uCTAX/xFGd0BvNJqkcUeMRGiRIzNsjGOV1eqGzauW6ZfONG+mie1nkBi8Q
	dWtQQhZvnsOUMlFD7Ky1HP5xxC1z/mLRjMz3kV2pOmCOTYjEpE3e0oMH8MvaTiu4Ptl4YCGM0hPz4
	eavurayyFy1FrtOTI2sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtpp9-002PtM-2b;
	Fri, 20 Oct 2023 13:45:59 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtpp5-002Po2-0b
	for linux-i3c@lists.infradead.org;
	Fri, 20 Oct 2023 13:45:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C67564000F;
	Fri, 20 Oct 2023 13:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697809531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lr/z7uihQprUld3MCX8m2TxbGzxLF1jBcFQtsJ1q8Lc=;
	b=biU7ESoHpgUw+DDQz7V86GfiGC9KtHEliOGtPOBH2lqU8v9/dKa7TpQRy/qtWhw8nFH2iv
	SPRudRRN8PXjnJSt1sep9Vyoc2uvua23p4NRnADvgbOFKXF9mYrqgSa2XYkuvqGRMkXqih
	2Djs7z08wehMsdbDIskMWYzd2tv3SX+rYNAMX16zDcP03I1XMldDNv98b8aUIcFRx3QMyx
	L58Kusya/Twsickg6kRU0wnTpc5bksBZaWwlRxkmITvRWxHFGXzc/hIhcgXO5l8bd5FHp4
	9vTzCJC9Nr0T8VqOiewC15HTEuoOlfOBaNkbhdeIfHIBRzw7WnBR4SGJnvgOnQ==
Date: Fri, 20 Oct 2023 15:45:28 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Zbigniew, Lukwinski" <zbigniew.lukwinski@linux.intel.com>
Cc: Frank Li <Frank.Li@nxp.com>, alexandre.belloni@bootlin.com,
 conor.culhane@silvaco.com, imx@lists.linux.dev, joe@perches.com,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] i3c: master: add enable(disable) hot join in sys
 entry
Message-ID: <20231020154528.2f5f68f5@xps-13>
In-Reply-To: <57efe6de-cf65-32ed-fd1e-a388e1676c70@linux.intel.com>
References: <20231018205929.3435110-1-Frank.Li@nxp.com>
	<20231018205929.3435110-2-Frank.Li@nxp.com>
	<57efe6de-cf65-32ed-fd1e-a388e1676c70@linux.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_064555_386565_48C0F02F 
X-CRM114-Status: GOOD (  11.32  )
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

SGkgTHVrd2luc2tpLAoKemJpZ25pZXcubHVrd2luc2tpQGxpbnV4LmludGVsLmNvbSB3cm90ZSBv
biBGcmksIDIwIE9jdCAyMDIzIDEwOjU1OjI3CiswMjAwOgoKPiBPbiAxMC8xOC8yMDIzIDEwOjU5
IFBNLCBGcmFuayBMaSB3cm90ZToKPiA+IEFkZCBob3Rqb2luIGVudHJ5IGluIHN5cyBmaWxlIHN5
c3RlbSBhbGxvdyB1c2VyIGVuYWJsZS9kaXNhYmxlIGhvdGpvaW4KPiA+IGZlYXR1cmUuCj4gPgo+
ID4gQWRkICgqZW5hYmxlKGRpc2FibGUpX2hvdGpvaW4pKCkgdG8gaTNjX21hc3Rlcl9jb250cm9s
bGVyX29wcy4KPiA+IEFkZCBhcGkgaTNjX21hc3Rlcl9lbmFibGUoZGlzYWJsZSlfaG90am9pbigp
OyAgCj4gCj4gV2hhdCBpcyB0aGUgdXNlIGNhc2UgZm9yIGhhdmluZyBISiBlbmFibGUga25vYiBp
biBzeXNmcyBhdmFpbGFibGUgZm9yIHVzZXIgc3BhY2Ugb3RoZXIgdGhhbiBmb3IgZGVidWcgc3R1
ZmY/IEluIG90aGVyIHdvcmRzLCBkb2VzIHVzZXIgc3BhY2UgcmVhbGx5IG5lZWQgdG8gZW5hYmxl
L2Rpc2FibGUgSEogaW4gcnVudGltZSBmb3Igb3RoZXIgcmVhc29uIGJ1dCBkZWJ1Zz8gSWYgaXQg
aXMgb25seSBmb3IgZGVidWcgbWF5YmUgaXTCoCBjb3VsZCBiZSBtb3ZlIHRvIGRlYnVnRlM/CgpJ
IGRvbid0IHRoaW5rIGhvdGpvaW4gc2hvdWxkIGJlIGNvbnNpZGVyZWQgYXMgYSBkZWJ1ZyBmZWF0
dXJlLiBUaGUKcHJvYmxlbSBoZXJlIGlzIHRoZSBwb3dlciBjb25zdW1wdGlvbiB3aGljaCBpcyBo
aWdoZXIgaWYgeW91IGVuYWJsZQp0aGlzIGZlYXR1cmUgKHlvdSBuZWVkIHRvIGtlZXAgZXZlcnl0
aGluZyBjbG9ja2VkIGFuZCByZWFkeSB0byBoYW5kbGUKYW4gSUJJKSB3aGVyZWFzIGlmIHlvdXIg
ZGVzaWduIGlzICJmaXhlZCIgKG1vcmUgbGlrZSBhbiBJMkMgYnVzKSB5b3UKbWF5IHNhdmUgcG93
ZXIgYnkgZGlzYWJsaW5nIHRoaXMgZmVhdHVyZS4KCkEgbW9kdWxlIHBhcmFtZXRlciBkb2VzIG5v
dCBmaXQgaGVyZSBiZWNhdXNlIGl0J3MgYSBwZXItYnVzCmNvbmZpZ3VyYXRpb24uCgpUaGFua3Ms
Ck1pcXXDqGwKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtaTNjCg==
