Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B14BCF649D
	for <linux-i3c@archiver.kernel.org>; Mon, 30 Sep 2024 10:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DwRPNeDdWUDTQ1wG7oq94MnoIzceC1dsxV2Tbqo+lyE=; b=W31KOkSGPvmzIj
	Z4cdVZ0uHfFejaQZ27mQTZTMRhttrJsGzjEDYGuC55l5oKmSOBfBqE9s9/p8eZyUQVJIN3Q/FCBqx
	aLfBr4+TBA3maW61MQKmgqBhqDhm2nGT9FPjISTWunjynW11vG55pm8OE3QkyCUDxvkSSBJsd95j5
	bp1ZiHsyqIZvZ0v4hk1J5K5JavWwtx7/751LrmTJz9zwk67Vc9klv2zfJhLTojWjZVrIXhifaqxpu
	7YVn7nUIb3pHQmJeCRD8dlf0mYgVhHFHCXLzBZx/6YvOyACmk/j09SIXGUOrZO+kp/zEizElTraCT
	Lt7zqpbIjLVC6akdNVdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svDFx-0000000GckO-17WU;
	Mon, 30 Sep 2024 10:03:53 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svCnk-0000000GYBG-0KXw
	for linux-i3c@lists.infradead.org;
	Mon, 30 Sep 2024 09:34:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C4E7DE0007;
	Mon, 30 Sep 2024 09:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727688880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T376I2MDrJytTDm4/y8a91oboBCmnAZ5VqjHr2jS9eI=;
	b=Ydffyoc8eP4yYmGUFFPfMukBflSB14CFQqzVpdFCQVXOhkgFmcNq5KDYhOMWjosOOFYNYY
	kbb9gKnvQVf01UV4UFGS5mDyVS+0lzu8eoSb8zdchrGyinkVkjVWi9YGjg7MPossiNNybH
	yPM1XObl+VqC+rlPqMCExq1eTvcylkH+w3ZRiBHmCo3jwxrUxI2f8FbIrfTTbJ62e0c9nh
	jpK9K+POPRlo2t9/TZg/YrZEwCJGtrmo6UMAiNXqQ8of5MMkvMUaiZvJq/MUnJPoIIckp0
	VcNid5AG0Pmz7qVfe0Sz63yqFGapO6lxBikxNy2Lu2cvTMGTPa+2jwnl6YIVFw==
Date: Mon, 30 Sep 2024 11:34:36 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Parshuram Thombare <pthombar@cadence.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Boris Brezillon
 <bbrezillon@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Conor Culhane
 <conor.culhane@silvaco.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, Ravindra Yashvant Shinde
 <ravindra.yashvant.shinde@nxp.com>, stable@kernel.org
Subject: Re: [PATCH v4 00/11] i3c: master: some fix and improvemnt for
 hotjoin
Message-ID: <20240930113436.318a7c0f@xps-13>
In-Reply-To: <ZvWTjjuRU26dTyKT@lizhi-Precision-Tower-5810>
References: <20240829-i3c_fix-v4-0-ebcbd5efceba@nxp.com>
	<ZvWTjjuRU26dTyKT@lizhi-Precision-Tower-5810>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_023444_600315_03F69807 
X-CRM114-Status: GOOD (  17.82  )
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

SGkgRnJhbmssCgpGcmFuay5saUBueHAuY29tIHdyb3RlIG9uIFRodSwgMjYgU2VwIDIwMjQgMTM6
MDI6MDYgLTA0MDA6Cgo+IE9uIFRodSwgQXVnIDI5LCAyMDI0IGF0IDA1OjEzOjU3UE0gLTA0MDAs
IEZyYW5rIExpIHdyb3RlOgo+ID4gU2lnbmVkLW9mZi1ieTogRnJhbmsgTGkgPEZyYW5rLkxpQG54
cC5jb20+Cj4gPiAtLS0gIAo+IAo+IEFsZXg6Cj4gCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXgtaTNjLzIwMjQwODE5LWkzY19maXgtdjMtMC03ZDY5ZjdiMGEwNWVAbnhwLmNvbS9ULyNt
MTZmYTliYjg3NWIwYWU5ZDM3YzVmNmU5MWY5MGUzNzU1NTFjNjM2Ngo+IAo+IFRoZXJlIGlzIHNv
bWUgZGlzY3VzcyBhYm91dCBhc3NpZ2VkIGFkZHJlc3MsIEkgYWxyZWFkeSBleHBsYWluIHRoZSBy
ZWFzb24KPiBhbmQgcGluZyAzIHRpbWVzLAoKUGluZ2luZyB3aWxsIG5vdCBoZWxwIGFzIGxvbmcg
YXMgdGhlIGNvZGUgaXMgbm90IGNsZWFyIGFuZCBzaW1wbGlmaWVkLgpJIGhvbmVzdGx5IHRoaW5r
IHRoZSBQSUQgc2hvdWxkIGJlIHJldHJpZXZlZCBlYXJsaWVyIGluIHRoZSBIQ0kgcGFydAphbmQg
dGhhdCB3b3VsZCBzb2x2ZSBtb3N0IG9mIHlvdXIgaXNzdWVzLgoKT3RoZXJ3aXNlIGlmIHRoYXQg
aXMgbm90IHBvc3NpYmxlIEkgc3RpbGwgZmluZCBoYXJkIHRvIHVuZGVyc3RhbmQgdGhlCmJpZyBw
aWN0dXJlLCB0aGUgY29tbWVudHMgYW5kIHRoZSBjb2RlLiBJJ3ZlIGFscmVhZHkgc3BlbnQgcXVp
dGUgYSBiaXQKb2YgdGltZSB0cnlpbmcgdG8gaW1wcm92ZSBpdCB3aXRoIHlvdSwgYnV0IHRoZSBs
b2dpYyBpcyBzdGlsbCBhIGxpdHRsZQpiaXQgdG9vIHNwZWNpZmljIGFuZCBjb21wbGV4IGZyb20g
bXkgcG9pbnQgb2Ygdmlldy4KCj4gVGhlc2UgcGF0Y2ggYXJlIGFjdHVhbCBmaXhlZCBob3Qgam9p
biBpc3N1ZXMuCgpJdCBzaG91bGQgbm90IGJlIHRoZSBjYXNlLiBIb3Qtam9pbiBzaG91bGQgd29y
ayB3aXRob3V0IHRoZSBkZXZpY2VzCmhhdmluZyBhbGwgdGhlIHRpbWUgdGhlIHByZWZlcnJlZCBh
ZGRyZXNzLiBJZiBob3Qtam9pbiByZWFsbHkgZG9lcwpub3Qgd29yaywgdGhlbiBwbGVhc2Ugc3Bs
aXQgdGhlIHNlcmllcyB3aXRoIHRoZSAicHJlZmVycmVkIGFkZHJlc3MiCmhhbmRsaW5nIGJlaW5n
IGRvbmUgYXBhcnQgaW4gYSBzZWNvbmQgc2VyaWVzLgoKVGhhbmtzLApNaXF1w6hsCgotLSAKbGlu
dXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
