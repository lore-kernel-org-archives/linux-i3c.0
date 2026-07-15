Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29DCCC44508
	for <linux-i3c@archiver.kernel.org>; Wed, 15 Jul 2026 01:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=70+JEkhRWaHu6Qub5jTeulHJd4ZIcXbpMI3ODhisD4w=; b=kCV189IjKB2FvV
	zUJ1DnWKCwmct+tesQaGji5onh0wkXe3QZAjdH8qTP7IY72LGXzoN3rADfihz6mod4xGrN34m6Thm
	CNyDM2rVif4OPxxBR607+PFPz/iIDlThl2i1SO6L1n2RiOS51eAe6I/Q/TCBVPMFayDABKEUPB2P8
	P+VqNBkiuudLttV/sOAp7wxrvAwjrW5IFABF1ofUHYLQ39T71FVSDkaHk4NaatkkrjY+NB5wAADgt
	+ipNDXIiTooUMmVVTzWKFiEyrVP2/vd3m0nvUq4HFhmvrxwKC2LouJh9ahfSFsbv4EERHJZKro+Mv
	PCmC3b99kbJFsGFNFHzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjokA-0000000DaXf-3IS3;
	Wed, 15 Jul 2026 01:49:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjok9-0000000DaXY-2b7B
	for linux-i3c@lists.infradead.org;
	Wed, 15 Jul 2026 01:49:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D13CC600BB;
	Wed, 15 Jul 2026 01:49:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB4681F000E9;
	Wed, 15 Jul 2026 01:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784080140;
	bh=JJAFG+1luCrDdaPm5cvLTpEXDBFRzAg3+MYnP3/osho=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FkR27m/FXkgssO4ubI0JrtFUW5fV8SZdqUxp2dSeNleADEuEhtC7I3DwyYGgb5Zto
	 b47sQwhA/DrbCHGu9mOi8NbdH6GmfetBCfi33T8JSe2+UMy7fif75mH7qxYhuoKFnh
	 rOggMcYkxnDqc7lVyJGEQTUkOXHU1Bo2yGwjip4XAfUvrEtqmIKY6z+6Xf811DszP7
	 vfMmf0ihX4cU0Ex0soan3HX1TgsWH7P7AiX9qJxQlFQi3AUGWspU+QhHd5KRATYFDB
	 cYpQtVAquQWZsTgf0VxMMYzNfhY7b5tuSxzJ12En6MkAEhKLOTgVi0hSI88MC25YmD
	 hKIP9sV7K9XRw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] i3c: master: adi: add OF module alias for autoloading
To: "Can Peng" <pengcan@kylinos.cn>
Cc: linux-i3c@lists.infradead.org, Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260715012949.180245-1-pengcan@kylinos.cn>
References: <20260715012949.180245-1-pengcan@kylinos.cn>
Date: Wed, 15 Jul 2026 01:48:58 +0000
Message-Id: <20260715014859.EB4681F000E9@smtp.kernel.org>
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

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtIaWdoXSBNaXNzaW5nIGByZXR1cm5gIHN0YXRlbWVudCB3aGVuIHBlcmlwaGVyYWwgdmVyc2lv
biBjaGVjayBmYWlscyBpbiBwcm9iZSBmdW5jdGlvbi4KLSBbSGlnaF0gV2hlbiBhbiBhY3RpdmUg
STNDIHRyYW5zZmVyIHRpbWVzIG91dCwgdGhlIHF1ZXVlIHN0YWxscyBiZWNhdXNlIHRoZSBuZXh0
IHBlbmRpbmcgdHJhbnNmZXIgaXMgbm90IHN0YXJ0ZWQsIGFuZCBuZXcgdHJhbnNmZXJzIGJ5cGFz
cyB0aGUgcXVldWUuCi0tCgotLS0gUGF0Y2ggWzFdOiBbUEFUQ0hdIGkzYzogbWFzdGVyOiBhZGk6
IGFkZCBPRiBtb2R1bGUgYWxpYXMgZm9yIGF1dG9sb2FkaW5nIC0tLQpjb21taXQgNWIyY2M0MWYy
Y2Y2ZGViYThhYmUzMzcwOTJmNjUyZDUyNWI2NzU2ZApBdXRob3I6IENhbiBQZW5nIDxwZW5nY2Fu
QGt5bGlub3MuY24+CgppM2M6IG1hc3RlcjogYWRpOiBhZGQgT0YgbW9kdWxlIGFsaWFzIGZvciBh
dXRvbG9hZGluZwoKVGhlIEFuYWxvZyBEZXZpY2VzIEkzQyBtYXN0ZXIgZHJpdmVyIGNhbiBiZSBi
dWlsdCBhcyBhIG1vZHVsZSBhbmQgdXNlcwphZGlfaTNjX21hc3Rlcl9vZl9tYXRjaCBhcyBpdHMg
T0YgbWF0Y2ggdGFibGUsIGJ1dCB0aGUgdGFibGUgaXMgbm90CmV4cG9ydGVkIGZvciBtb2R1bGUg
YWxpYXMgZ2VuZXJhdGlvbi4gVGhpcyBjb21taXQgYWRkcyB0aGUKTU9EVUxFX0RFVklDRV9UQUJM
RSBlbnRyeSBzbyBtb2Rwb3N0IGNhbiBnZW5lcmF0ZSBPRiBtb2R1bGUgYWxpYXNlcy4KCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci9hZGktaTNjLW1hc3Rlci5jIGIvZHJpdmVycy9p
M2MvbWFzdGVyL2FkaS1pM2MtbWFzdGVyLmMKPiBpbmRleCBlMjlhYWMyODY5NTc3Li5mYjRjZmM5
MDI2Y2NmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci9hZGktaTNjLW1hc3Rlci5j
Cj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL2FkaS1pM2MtbWFzdGVyLmMKPiBAQCAtOTI5LDYg
KzkyOSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGFkaV9pM2NfbWFzdGVy
X29mX21hdGNoW10gPSB7Cj4gIAl7IC5jb21wYXRpYmxlID0gImFkaSxpM2MtbWFzdGVyLXYxIiB9
LAo+ICAJe30KPiAgfTsKPiArTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgYWRpX2kzY19tYXN0ZXJf
b2ZfbWF0Y2gpOwo+ICAKPiAgc3RhdGljIGludCBhZGlfaTNjX21hc3Rlcl9wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICB7CgpbIC4uLiBdCgo+IAl2ZXJzaW9uID0gcmVhZGwo
bWFzdGVyLT5yZWdzICsgQURJX0FYSV9SRUdfVkVSU0lPTik7Cj4gCWlmIChBRElfQVhJX1BDT1JF
X1ZFUl9NQUpPUih2ZXJzaW9uKSAhPSAxKQo+IAkJZGV2X2Vycl9wcm9iZSgmcGRldi0+ZGV2LCAt
RU5PREVWLCAiVW5zdXBwb3J0ZWQgcGVyaXBoZXJhbCB2ZXJzaW9uICV1LiV1LiV1XG4iLAo+IAkJ
CSAgICAgIEFESV9BWElfUENPUkVfVkVSX01BSk9SKHZlcnNpb24pLAo+IAkJCSAgICAgIEFESV9B
WElfUENPUkVfVkVSX01JTk9SKHZlcnNpb24pLAo+IAkJCSAgICAgIEFESV9BWElfUENPUkVfVkVS
X1BBVENIKHZlcnNpb24pKTsKPiAKPiAJd3JpdGVsKDB4MDAsIG1hc3Rlci0+cmVncyArIFJFR19F
TkFCTEUpOwoKW1NldmVyaXR5OiBIaWdoXQpUaGlzIGlzIGEgcHJlLWV4aXN0aW5nIGlzc3VlLCBi
dXQgZG9lcyBhZGlfaTNjX21hc3Rlcl9wcm9iZSgpIG5lZWQgYSByZXR1cm4Kc3RhdGVtZW50IHdo
ZW4gdGhlIHBlcmlwaGVyYWwgdmVyc2lvbiBjaGVjayBmYWlscz8KCkl0IGxvb2tzIGxpa2UgaWYg
YW4gdW5zdXBwb3J0ZWQgaGFyZHdhcmUgdmVyc2lvbiBpcyBkZXRlY3RlZCwgaXQgbG9ncyBhbgpl
cnJvciB2aWEgZGV2X2Vycl9wcm9iZSgpIGJ1dCBleGVjdXRpb24gZmFsbHMgdGhyb3VnaCBhbmQg
Y29udGludWVzIGhhcmR3YXJlCmluaXRpYWxpemF0aW9uLgoKW1NldmVyaXR5OiBIaWdoXQpUaGlz
IGlzbid0IGEgYnVnIGludHJvZHVjZWQgYnkgdGhpcyBwYXRjaCwgYnV0IGNhbiB0aGUgcXVldWUg
c3RhbGwgaWYgYW4KYWN0aXZlIEkzQyB0cmFuc2ZlciB0aW1lcyBvdXQ/CgpMb29raW5nIGF0IGFk
aV9pM2NfbWFzdGVyX3VucXVldWVfeGZlcigpLCB3aGVuIGEgdGltZW91dCBjYW5jZWxzIHRoZSBh
Y3RpdmUKdHJhbnNmZXIsIGl0IHNldHMgbWFzdGVyLT54ZmVycXVldWUuY3VyIHRvIE5VTEwgYnV0
IGRvZXNuJ3QgY2hlY2sgdGhlIGxpc3QKdG8gc3RhcnQgdGhlIG5leHQgcGVuZGluZyB0cmFuc2Zl
cjoKCmRyaXZlcnMvaTNjL21hc3Rlci9hZGktaTNjLW1hc3Rlci5jOmFkaV9pM2NfbWFzdGVyX3Vu
cXVldWVfeGZlcigpIHsKLi4uCglndWFyZChzcGlubG9ja19pcnFzYXZlKSgmbWFzdGVyLT54ZmVy
cXVldWUubG9jayk7CglpZiAobWFzdGVyLT54ZmVycXVldWUuY3VyID09IHhmZXIpCgkJbWFzdGVy
LT54ZmVycXVldWUuY3VyID0gTlVMTDsKCWVsc2UKCQlsaXN0X2RlbF9pbml0KCZ4ZmVyLT5ub2Rl
KTsKLi4uCn0KCkFkZGl0aW9uYWxseSwgbmV3bHkgcXVldWVkIHRyYW5zZmVycyBpbiBhZGlfaTNj
X21hc3Rlcl9xdWV1ZV94ZmVyKCkgd2lsbApieXBhc3MgYW55IHdhaXRpbmcgdHJhbnNmZXJzIGlm
IHRoZSB0aW1lb3V0IGxlZnQgdGhlIGN1cnJlbnQgcG9pbnRlciBhcyBOVUxMOgoKZHJpdmVycy9p
M2MvbWFzdGVyL2FkaS1pM2MtbWFzdGVyLmM6YWRpX2kzY19tYXN0ZXJfcXVldWVfeGZlcigpIHsK
Li4uCglndWFyZChzcGlubG9ja19pcnFzYXZlKSgmbWFzdGVyLT54ZmVycXVldWUubG9jayk7Cglp
ZiAobWFzdGVyLT54ZmVycXVldWUuY3VyKSB7CgkJbGlzdF9hZGRfdGFpbCgmeGZlci0+bm9kZSwg
Jm1hc3Rlci0+eGZlcnF1ZXVlLmxpc3QpOwoJfSBlbHNlIHsKCQltYXN0ZXItPnhmZXJxdWV1ZS5j
dXIgPSB4ZmVyOwoJCWFkaV9pM2NfbWFzdGVyX3N0YXJ0X3hmZXJfbG9ja2VkKG1hc3Rlcik7Cgl9
Ci4uLgp9CgpEb2VzIHRoZSBkcml2ZXIgbmVlZCB0byBjYWxsIGFkaV9pM2NfbWFzdGVyX3N0YXJ0
X3hmZXJfbG9ja2VkKCkgZm9yIHRoZQpuZXh0IGl0ZW0gaW4gbWFzdGVyLT54ZmVycXVldWUubGlz
dCB3aGVuIGNsZWFyaW5nIHRoZSBhY3RpdmUgdHJhbnNmZXI/CgotLSAKU2FzaGlrbyBBSSByZXZp
ZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNzE1MDEyOTQ5LjE4MDI0
NS0xLXBlbmdjYW5Aa3lsaW5vcy5jbj9wYXJ0PTEKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0
CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
