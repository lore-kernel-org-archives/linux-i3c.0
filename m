Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC14EE6456
	for <linux-i3c@archiver.kernel.org>; Thu, 12 Sep 2024 06:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AlvJEtROtOdKIohvFzPMAW/UtLjo/o4W0h+nRiHEHco=; b=Qqe/8QgXEbwpns
	r23Sg9YsuRFS005dnGKPiuoFEi+K2jTo5JNtmhMvIBtrPZjNcot0Q+LSKFJmsHdyUd7OOfM0cKjMc
	C0Fxs4CgxPE5eSBntA0/hCQxlZwB17Zik8rzuQtmpEhWtkb5JEziTD8QjAqHpEPmuMW1/0BYweV5T
	US2PaaUQTcvNU+hMjNnqkHxrOxVuZMUIKLLiG03d8+9lWHDQsWImjy1hEOcGeBEBinCKUnj9Xcuc/
	T5cxjZ2908ZWqQDmK6dm1+3pQOxziYMn5HiZsz2dSTc1bFDZZnpFD+oWQyNxGcsVTXo+dt1DN4CEF
	xd2TZ3Aqxmxsu7GHSrEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sodmI-0000000C5Pl-0qAR;
	Thu, 12 Sep 2024 06:58:06 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sodlZ-0000000C5Id-0McM
	for linux-i3c@lists.infradead.org;
	Thu, 12 Sep 2024 06:58:04 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 42AB2FF808;
	Thu, 12 Sep 2024 06:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726124234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dx873EE+Zbpqb0LcknS8snbosCHYhAZ1Drfd3qd+3Eg=;
	b=nXY6lTCE1pE7tr2Ao3SJXwpv2lPcyrrxWzySsdX6D/Ye08rctvCMGfZ/61hTkiQBn4t4pV
	6bC8Yc/4juV61DxTQahuu/WOsYIXm+A/hZJTsvye6fKvWmRw2RmYRdTuvsip1k4qkLNIA+
	sTYnmIX7nGyRoBDwtpcHpf7NB5J9kNMHaG93iOXoYFpjHfxE+H+N8B2fSHb6JvPuiAdmML
	AzAgAACWXtPnCxgWD79/Q6plw2x26FOklUyMpuY+O7bcDJjbzIov9KWW8GAoAquqlM8YtL
	eZ1F1yqeAylfUwQK30amHsCut9lPanOomOoY0To4OVLEB+zsWCApjocmQ3FbEA==
Date: Thu, 12 Sep 2024 08:57:09 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Kaixin Wang <kxwang23@m.fudan.edu.cn>, 21210240012@m.fudan.edu.cn,
 21302010073@m.fudan.edu.cn, conor.culhane@silvaco.com,
 alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: master: svc: Fix use after free vulnerability in
 svc_i3c_master Driver Due to Race Condition
Message-ID: <20240912085709.6ec0a289@xps-13>
In-Reply-To: <ZuG2SbsHEU5BU9mX@lizhi-Precision-Tower-5810>
References: <20240911150135.839946-1-kxwang23@m.fudan.edu.cn>
	<ZuG2SbsHEU5BU9mX@lizhi-Precision-Tower-5810>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_235721_935368_787D33BE 
X-CRM114-Status: GOOD (  16.23  )
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

SGksCgpGcmFuay5saUBueHAuY29tIHdyb3RlIG9uIFdlZCwgMTEgU2VwIDIwMjQgMTE6MjQ6NTcg
LTA0MDA6Cgo+IE9uIFdlZCwgU2VwIDExLCAyMDI0IGF0IDExOjAxOjM1UE0gKzA4MDAsIEthaXhp
biBXYW5nIHdyb3RlOgo+ID4gSW4gdGhlIHN2Y19pM2NfbWFzdGVyX3Byb2JlIGZ1bmN0aW9uLCAm
bWFzdGVyLT5oal93b3JrIGlzIGJvdW5kIHdpdGgKPiA+IHN2Y19pM2NfbWFzdGVyX2hqX3dvcmss
ICZtYXN0ZXItPmliaV93b3JrIGlzIGJvdW5kIHdpdGgKPiA+IHN2Y19pM2NfbWFzdGVyX2liaV93
b3JrLiBBbmQgc3ZjX2kzY19tYXN0ZXJfaWJpX3dvcmsgwqBjYW4gc3RhcnQgdGhlCj4gPiBoal93
b3JrLCBzdmNfaTNjX21hc3Rlcl9pcnFfaGFuZGxlciBjYW4gc3RhcnQgdGhlIGliaV93b3JrLgo+
ID4KPiA+IElmIHdlIHJlbW92ZSB0aGUgbW9kdWxlIHdoaWNoIHdpbGwgY2FsbCBzdmNfaTNjX21h
c3Rlcl9yZW1vdmUgdG8KPiA+IG1ha2UgY2xlYW51cCwgaXQgd2lsbCBmcmVlIG1hc3Rlci0+YmFz
ZSB0aHJvdWdoIGkzY19tYXN0ZXJfdW5yZWdpc3Rlcgo+ID4gd2hpbGUgdGhlIHdvcmsgbWVudGlv
bmVkIGFib3ZlIHdpbGwgYmUgdXNlZC4gVGhlIHNlcXVlbmNlIG9mIG9wZXJhdGlvbnMKPiA+IHRo
YXQgbWF5IGxlYWQgdG8gYSBVQUYgYnVnIGlzIGFzIGZvbGxvd3M6Cj4gPgo+ID4gQ1BVMCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQ1BVMQo+ID4KPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgc3ZjX2kzY19tYXN0ZXJfaGpfd29yawo+ID4g
c3ZjX2kzY19tYXN0ZXJfcmVtb3ZlICAgICAgICAgICAgICAgfAo+ID4gaTNjX21hc3Rlcl91bnJl
Z2lzdGVyKCZtYXN0ZXItPmJhc2UpfAo+ID4gZGV2aWNlX3VucmVnaXN0ZXIoJm1hc3Rlci0+ZGV2
KSAgICAgfAo+ID4gZGV2aWNlX3JlbGVhc2UgICAgICAgICAgICAgICAgICAgICAgfAo+ID4gLy9m
cmVlIG1hc3Rlci0+YmFzZSAgICAgICAgICAgICAgICAgfAo+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCBpM2NfbWFzdGVyX2RvX2RhYSgmbWFzdGVyLT5iYXNlKQo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAvL3VzZSBtYXN0ZXItPmJhc2UK
PiA+Cj4gPiBGaXggaXQgYnkgZW5zdXJpbmcgdGhhdCB0aGUgd29yayBpcyBjYW5jZWxlZCBiZWZv
cmUgcHJvY2VlZGluZyB3aXRoIHRoZQo+ID4gY2xlYW51cCBpbiBzdmNfaTNjX21hc3Rlcl9yZW1v
dmUuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogS2FpeGluIFdhbmcgPGt4d2FuZzIzQG0uZnVkYW4u
ZWR1LmNuPgo+ID4gLS0tICAKPiAKPiBQbGVhc2UgYWRkIGZpeGVzIHRhZyBhbmQgY2Mgc3RhYmxl
LgoKWWVzIGluZGVlZC4gT3RoZXJ3aXNlIGxvb2tzIGdvb2QgdG8gbWUgb25jZSB0aGlzIGZpeGVk
LgoKUmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+
CgpUaGFua3MsCk1pcXXDqGwKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtaTNjCg==
