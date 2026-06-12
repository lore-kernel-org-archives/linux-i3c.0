Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971E0CD98CE
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Jun 2026 11:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jXQ4kaa0NL1juC52LIq9Ad5zEWJuUfL5oA+YMxKhxqc=; b=l60Z5zRF7oiVo1
	RK6ia6SrAhdGkV5cNtMy+r0YZOFSHGL6SiyOPa/5e9ErRiGoc/FPCCWQeNDk0UOZKnjcyb03q7ccq
	bTSsPSoio8il3LNiJwIoDR2yfYGzY3uwxti/6JP14DjYHc8TtQkx0+s01EFeuxfZVXXCbVKtxci0Y
	8GCyXhjgeUhE5/U4MN/Kd9I17niEG6Uak3aHdIsOIEAzWN9rptUtjYI8ZMvb3wkmIG/hkjMlK3Q0r
	ES2jdFFZW2iLFo6+NQv/ngTIBZvM10nLVJC/isIPX0bpxgwrSSoj2YH+3yF+TOMdZjvJG3wSuwf4p
	rsTa6qsdOskVMFfx2aNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY0G0-0000000AoYr-1TWy;
	Fri, 12 Jun 2026 11:41:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY0Fy-0000000AoYe-36rh
	for linux-i3c@lists.infradead.org;
	Fri, 12 Jun 2026 11:41:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 768C5406FD;
	Fri, 12 Jun 2026 11:41:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1697A1F00A3A;
	Fri, 12 Jun 2026 11:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781264462;
	bh=dq7RfP6GXcj+LvatFMrY/oTCV+SoRKi7cDYyZlTFaGE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jM2PKxP3zdapIbTy5z4ASK+INFKfi8bfXB6NzTphE+NQqplUi5kyMxomnnlW7j/Mi
	 rU9RcF77wQsTD3rrxvG56VsJjWgkzrO0L6FcCtFFwrUZU2ebieCHevZMTkzJuMIB6J
	 LuV27UGD8T3BlR7oITKyNZI9MzDC4BtXRWke2Sc2C6icO0iZeqJXrV8M+QDeF0Xz8/
	 RtBoYL55esDYLzQWUJz9ziX4huB/Sbs//wq+3MjlQxLbU86LGGRu0uCUSOp+8Mt8Qm
	 cA7qAipvxPJwcjaWdARHk5QWIn3I387xSevfZ1jrmJFS0EHSS6rJ9GwO6vx3YW2ypn
	 kqQ/e/kUU12Iw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 5/9] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c
 hub and on-die regulator
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260612111816.3688240-6-lakshay.piplani@nxp.com>
References: <20260612111816.3688240-6-lakshay.piplani@nxp.com>
Date: Fri, 12 Jun 2026 11:41:01 +0000
Message-Id: <20260612114102.1697A1F00A3A@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIFRoZSBkcml2ZXIgaW5j
b3JyZWN0bHkgYmluZHMgdG8gYW55IGdlbmVyaWMgSTNDIGh1YiBkZXZpY2Ugb24gdGhlIGJ1cy4K
LSBbTG93XSBUaGUgZHJpdmVyIGJ5cGFzc2VzIHRoZSBJM0Mgc3Vic3lzdGVtIGFic3RyYWN0aW9u
IGJ5IGluY2x1ZGluZyA8bGludXgvaTNjL21hc3Rlci5oPiBpbnN0ZWFkIG9mIDxsaW51eC9pM2Mv
ZGV2aWNlLmg+LgotLQoKY29tbWl0IDM2ODJjYTNjNjZlMzViMDZlODg4MjNlODA4MWM1N2IzZWEx
ZDQwODQKQXV0aG9yOiBBbWFuIEt1bWFyIFBhbmRleSA8YW1hbi5rdW1hcnBhbmRleUBueHAuY29t
PgoKbWZkOiBwM2gyeDR4OiBBZGQgZHJpdmVyIGZvciBOWFAgUDNIMng0eCBpM2MgaHViIGFuZCBv
bi1kaWUgcmVndWxhdG9yCgpBZGQgY29yZSBNRkQgc3VwcG9ydCBmb3IgdGhlIE5YUCBQM0gyeDR4
IChQM0gyNDQwL1AzSDI0NDEvUDNIMjg0MC9QM0gyODQxKQpmYW1pbHkgb2YgbXVsdGlwb3J0IEkz
QyBodWIgZGV2aWNlcy4gVGhlc2UgZGV2aWNlcyBjb25uZWN0IHRvIGEgaG9zdCB2aWEKSTNDL0ky
Qy9TTUJ1cyBhbmQgZXhwb3NlIG11bHRpcGxlIGRvd25zdHJlYW0gdGFyZ2V0IHBvcnRzLgoKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tZmQvcDNoMjg0MC5jIGIvZHJpdmVycy9tZmQvcDNoMjg0MC5j
Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAwLi4wYTgwOTkyZDYy
NTBhCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2RyaXZlcnMvbWZkL3AzaDI4NDAuYwo+IEBAIC0w
LDAgKzEsMTE5IEBACj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4gKy8q
Cj4gKyAqIENvcHlyaWdodCAyMDI1LTIwMjYgTlhQCj4gKyAqIFAzSDJYNFggaTNjIGh1YiBhbmQg
cmVndWxhdG9yIGRldmljZS4KPiArICovCj4gKwo+ICsjaW5jbHVkZSA8bGludXgvaTJjLmg+Cj4g
KyNpbmNsdWRlIDxsaW51eC9pM2MvbWFzdGVyLmg+CgpbU2V2ZXJpdHk6IExvd10KRG9lcyB0aGlz
IGluY2x1ZGUgYnlwYXNzIHRoZSBJM0Mgc3Vic3lzdGVtIGFic3RyYWN0aW9uPyBCeSBpbmNsdWRp
bmcgdGhlCm1hc3RlciBoZWFkZXIsIHRoZSBkcml2ZXIgaGFzIGFjY2VzcyB0byB0aGUgaW50ZXJu
YWwgZGVmaW5pdGlvbiBvZgpzdHJ1Y3QgaTNjX2RldmljZS4gU2hvdWxkIHRoaXMgaW5jbHVkZSA8
bGludXgvaTNjL2RldmljZS5oPiBpbnN0ZWFkPwoKWyAuLi4gXQoKPiArc3RhdGljIGludCBwM2gy
eDR4X2RldmljZV9wcm9iZV9pM2Moc3RydWN0IGkzY19kZXZpY2UgKmkzY2RldikKPiArewo+ICsJ
c3RydWN0IHAzaDJ4NHhfZGV2ICpkZGF0YTsKPiArCWludCByZXQ7Cj4gKwo+ICsJZGRhdGEgPSBk
ZXZtX2t6YWxsb2MoJmkzY2Rldi0+ZGV2LCBzaXplb2YoKmRkYXRhKSwgR0ZQX0tFUk5FTCk7Cgpb
U2V2ZXJpdHk6IExvd10KVGhpcyBkaXJlY3RseSBhY2Nlc3NlcyB0aGUgaW50ZXJuYWwgZGV2IGZp
ZWxkIG9mIHN0cnVjdCBpM2NfZGV2aWNlLiBTaG91bGQKdGhpcyB1c2UgaTNjZGV2X3RvX2Rldihp
M2NkZXYpIHRvIG9idGFpbiB0aGUgdW5kZXJseWluZyBzdHJ1Y3QgZGV2aWNlIHBvaW50ZXIKdG8g
bWFpbnRhaW4gQVBJIGJvdW5kYXJpZXM/CgpbIC4uLiBdCgo+ICtzdGF0aWMgY29uc3Qgc3RydWN0
IGkzY19kZXZpY2VfaWQgcDNoMng0eF9pM2NfaWRzW10gPSB7Cj4gKwlJM0NfQ0xBU1MoSTNDX0RD
Ul9IVUIsIE5VTEwpLAo+ICsJeyAvKiBzZW50aW5lbCAqLyB9LAo+ICt9OwoKW1NldmVyaXR5OiBI
aWdoXQpXaWxsIHRoaXMgZHJpdmVyIGluYXBwcm9wcmlhdGVseSBiaW5kIHRvIGFueSBnZW5lcmlj
IEkzQyBodWIgZGV2aWNlIG9uIHRoZQpidXM/CgpVc2luZyBJM0NfQ0xBU1MoSTNDX0RDUl9IVUIs
IE5VTEwpIGluc3RydWN0cyB0aGUgc3Vic3lzdGVtIHRvIG1hdGNoIGFueQpkZXZpY2UgdGhhdCBh
ZHZlcnRpc2VzIHRoZSBnZW5lcmljIEh1YiBEQ1IgKDE5NCksIHdpdGhvdXQgZmlsdGVyaW5nIGJ5
CnZlbmRvciBvciBwYXJ0IElELgoKQmVjYXVzZSB0aGUgcHJvYmUgZnVuY3Rpb24gZG9lc24ndCB2
ZXJpZnkgdGhlIE1hbnVmYWN0dXJlciBJRCwgaXQgc2VlbXMgdGhpcwpjb3VsZCBlYWdlcmx5IGJp
bmQgdG8gdGhpcmQtcGFydHkgaHVicyBhbmQgYXR0ZW1wdCBOWFAtc3BlY2lmaWMgcmVnaXN0ZXIK
b3BlcmF0aW9ucyBvbiB0aGVtLgoKU2hvdWxkIHRoaXMgdXNlIEkzQ19ERVZJQ0UoSTNDX1ZFTkRP
Ul9OWFAsIC4uLikgdG8gZXhjbHVzaXZlbHkgbWF0Y2ggdGhlCnN1cHBvcnRlZCBOWFAgZGV2aWNl
cyBpbnN0ZWFkIG9mIHRoZSBnZW5lcmljIGh1YiBjbGFzcz8KCi0tIApTYXNoaWtvIEFJIHJldmll
dyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA2MTIxMTE4MTYuMzY4ODI0
MC0xLWxha3NoYXkucGlwbGFuaUBueHAuY29tP3BhcnQ9NQoKLS0gCmxpbnV4LWkzYyBtYWlsaW5n
IGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
