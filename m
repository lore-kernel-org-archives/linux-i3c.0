Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C2FC43458
	for <linux-i3c@archiver.kernel.org>; Tue, 30 Jun 2026 13:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hIJIwAZKAraTD3V7gXjSWN9mh41Vqo/8ycI8Gk1LKs4=; b=JohAF37Zn4YOzn
	nzKFDxphfuA2vpJwm9g3Mp4gOFAmO1vhNoFE44X3YCSkL4AV2rxulhXJaUz8IpXnKkj685wr/anrR
	lA2iIPt9leFaVbT2cQ88tcaJiNmI0wS+HW2+wkXIFugW4jFwIDTF9pYLG6YboRAvwb7v48P1hGtOP
	szNWFMSS6LYvo1WUPPs/iqgFkMoVm5Yi3FkxqNVUbvyG6j99mGMc+qEEdMvvJC5wAwFhzpM+eTUV5
	ivdYy9zrVu8yYuD6idA7MYi+d18Ta2EPQm5hAwEj7BW194NeDkjE7Hwgj/72Bl2lwBPQ3g/KIa4pW
	pgucMM63GfN/3+AKGHpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYZt-0000000HAze-1UYp;
	Tue, 30 Jun 2026 13:32:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYZr-0000000HAyc-406x
	for linux-i3c@lists.infradead.org;
	Tue, 30 Jun 2026 13:32:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A0CBE40870;
	Tue, 30 Jun 2026 13:32:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42C2F1F000E9;
	Tue, 30 Jun 2026 13:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782826359;
	bh=2dkwaG2W0n5IF8ebld/gTIYJzHqfTLyc7271ZpPci9Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A0RQccYsZ7JXvF+3dSby5nJstiiaNrr5mA2HYQpq6BGT3dH4GJFBz56C8WxKkhxph
	 A3s9Rg+WdzX18L4qGF3G7SDrLuNx85UqCaGOLqQOhzEuycj+ERVy1LGlFWLfNX+CGZ
	 O1zGwRAQUGqDJ7pj0vB4IuuArpLIEc+AEaAGRD73dc4O7jW0aXD5N2Y5e8Maz7Yl2X
	 gSM0OCozHTjTQrl4OLR38Y139bACN+XjuVwx+w+l1ZoJILYR1tW/M4fbQPOtnS6sWu
	 bzQqxT3SHNM46JuJ5mQ9sqzUPxzbNFXWskBQsRxnD73oJI93TZO5coGk9oNEES4S0o
	 +MSqOYCbbS5pA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] i3c: master: dw: Map CCC hardware errors to I3C
 M0/M2
To: tze.yee.ng@altera.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, linux-i3c@lists.infradead.org
In-Reply-To: <56a59c5ac9a09692f9ac8a74d1d3afdce553a7d1.1782824628.git.tze.yee.ng@altera.com>
References: <cover.1782824628.git.tze.yee.ng@altera.com>
 <56a59c5ac9a09692f9ac8a74d1d3afdce553a7d1.1782824628.git.tze.yee.ng@altera.com>
Date: Tue, 30 Jun 2026 13:32:38 +0000
Message-Id: <20260630133239.42C2F1F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gVW5kb2N1bWVudGVk
IGJlaGF2aW9yYWwgY2hhbmdlIGFuZCBzaWxlbnQgYnVnIGZpeAotLQoKY29tbWl0IDVhZmQ1ZmJl
ZThkYzkyNjExMDI4NGJhZTk4MzEwYjU5NzAxMzQxMzEKQXV0aG9yOiBBZHJpYW4gTmcgSG8gWWlu
IDxhZHJpYW4uaG8ueWluLm5nQGFsdGVyYS5jb20+CgppM2M6IG1hc3RlcjogZHc6IE1hcCBDQ0Mg
aGFyZHdhcmUgZXJyb3JzIHRvIEkzQyBNMC9NMgoKVGhpcyBjb21taXQgdXBkYXRlcyB0aGUgRGVz
aWduV2FyZSBJM0MgbWFzdGVyIGRyaXZlciB0byBtYXAgc3BlY2lmaWMKcmVzcG9uc2UgcXVldWUg
ZXJyb3JzIHRvIHN0YW5kYXJkIEkzQyBlcnJvciBjb2RlcyBNMCBhbmQgTTIuIEl0IGFsc28gcmV0
dXJucwotRUlPIGZvciBhZGRyZXNzIE5BQ0tzIGFuZCBpbnRyb2R1Y2VzIGR3X2kzY19jY2NfbWFw
X2VycigpIHRvIGNlbnRyYWxpemUKZXJyb3IgbWFwcGluZy4KCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvZHctaTNj
LW1hc3Rlci5jCj4gaW5kZXggZTY1OWVkZTc5ZmMwMy4uMjdkMjAyNWZjZjA0MSAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jCj4gKysrIGIvZHJpdmVycy9p
M2MvbWFzdGVyL2R3LWkzYy1tYXN0ZXIuYwoKWyAuLi4gXQoKPiBAQCAtNzQzLDEwICs3NjAsNyBA
QCBzdGF0aWMgaW50IGR3X2kzY19jY2Nfc2V0KHN0cnVjdCBkd19pM2NfbWFzdGVyICptYXN0ZXIs
Cj4gIAo+ICAJcmV0ID0geGZlci0+cmV0Owo+ICAJY21kID0gJnhmZXItPmNtZHNbMF07Cj4gLQlp
ZiAoIXJldCkKPiAtCQljY2MtPmRlc3RzWzBdLnBheWxvYWQuYWN0dWFsX2xlbiA9IGNtZC0+cnhf
bGVuOwo+IC0JaWYgKGNtZC0+ZXJyb3IgPT0gUkVTUE9OU0VfRVJST1JfSUJBX05BQ0spCj4gLQkJ
Y2NjLT5lcnIgPSBJM0NfRVJST1JfTTI7Cj4gKwljY2MtPmVyciA9IGR3X2kzY19jY2NfbWFwX2Vy
cihjbWQtPmVycm9yKTsKCltTZXZlcml0eTogTWVkaXVtXQpJcyB0aGlzIGFuIHVucmVsYXRlZCBi
dWcgZml4PyBUaGUgY29tbWl0IG1lc3NhZ2UgbWVudGlvbnMgbWFwcGluZyBoYXJkd2FyZQplcnJv
cnMgdG8gSTNDIE0wL00yLCBidXQgaXQgZG9lcyBub3QgbWVudGlvbiByZW1vdmluZyB0aGUgYXNz
aWdubWVudCBvZgphY3R1YWxfbGVuIGZyb20gdGhlIHRyYW5zbWl0IG9wZXJhdGlvbiBoZXJlLgoK
PiAgCj4gIAlyZXR1cm4gcmV0Owo+ICB9CgpbIC4uLiBdCgo+IEBAIC03ODMsOCArNzk5LDEwIEBA
IHN0YXRpYyBpbnQgZHdfaTNjX2NjY19nZXQoc3RydWN0IGR3X2kzY19tYXN0ZXIgKm1hc3Rlciwg
c3RydWN0IGkzY19jY2NfY21kICpjY2MpCj4gIAkJZHdfaTNjX21hc3Rlcl9kZXF1ZXVlX3hmZXIo
bWFzdGVyLCB4ZmVyKTsKPiAgCj4gIAlyZXQgPSB4ZmVyLT5yZXQ7Cj4gLQlpZiAoeGZlci0+Y21k
c1swXS5lcnJvciA9PSBSRVNQT05TRV9FUlJPUl9JQkFfTkFDSykKPiAtCQljY2MtPmVyciA9IEkz
Q19FUlJPUl9NMjsKPiArCWNtZCA9ICZ4ZmVyLT5jbWRzWzBdOwo+ICsJY2NjLT5lcnIgPSBkd19p
M2NfY2NjX21hcF9lcnIoY21kLT5lcnJvcik7Cj4gKwlpZiAoIXJldCkKPiArCQljY2MtPmRlc3Rz
WzBdLnBheWxvYWQuYWN0dWFsX2xlbiA9IGNtZC0+cnhfbGVuOwoKW1NldmVyaXR5OiBNZWRpdW1d
CkRvZXMgdGhpcyBzaWxlbnRseSBhZGQgdGhlIGFjdHVhbF9sZW4gYXNzaWdubWVudCB0byB0aGUg
cmVjZWl2ZSBvcGVyYXRpb24/CgpTaW5jZSBtb3ZpbmcgdGhpcyBhc3NpZ25tZW50IGZyb20gZHdf
aTNjX2NjY19zZXQoKSB0byBkd19pM2NfY2NjX2dldCgpIGlzCm5vdCBkb2N1bWVudGVkIGluIHRo
ZSBjb21taXQgbWVzc2FnZSwgc2hvdWxkIGl0IGJlIHNwbGl0IGludG8gYSBzZXBhcmF0ZQpmaXgg
b3IgZXhwbGljaXRseSBleHBsYWluZWQ/Cgo+ICAKPiAgCXJldHVybiByZXQ7Cj4gIH0KCi0tIApT
YXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvY292ZXIu
MTc4MjgyNDYyOC5naXQudHplLnllZS5uZ0BhbHRlcmEuY29tP3BhcnQ9MgoKLS0gCmxpbnV4LWkz
YyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
