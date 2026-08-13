Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0905C5B572
	for <linux-i3c@archiver.kernel.org>; Thu, 13 Aug 2026 05:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iW6wvj2zVpHDuHUYFy2pIkFXDbLqv9GvpYI35pXupgw=; b=bUU0Z8offige0g
	kUzyeWOUz3G+fYPyGIUAIdegInHbQrdUk6eaVmUWf6qzEcmuAFGqRMNysaMpJEK/B/4+pd1+DcFzr
	Tj8129zzZyA7Kr8I+ic4vf16HvLeZofRZFcM4Ax7+ARAHIRBkrVVMzxPhJfVS9bELx2HqFNLpkt/E
	iAy/4QOdHTZtj5yKlMFNF/fWOjHdzkBI6iI2FGFiOr8qghEmz5X6jQlez89a4WpS1OAodTlkRGnfj
	CRQzKHRT1vOZP3vZDSPrCh1bNrq1Pqn98eZS6iHVa4jeveISkJHqHRNEtdE6L54KeXmI7gipEBXXO
	OA/SIxuMlO3xGXU1Tn+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuNi9-0000000HOHi-45Lh;
	Thu, 13 Aug 2026 05:10:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuNi7-0000000HOHa-3hES
	for linux-i3c@lists.infradead.org;
	Thu, 13 Aug 2026 05:10:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4A5BA43C86;
	Thu, 13 Aug 2026 05:10:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2D511F00A3A;
	Thu, 13 Aug 2026 05:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786597835;
	bh=h+Ip7O1mCbK6gVeSbFGBscP3nRztIERWPSPYaJ4D5RA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=by4cw1PLON3itZRyeandsMZPDp9a6K7pU7ZbFGSOCE2qJt6kFgytWPwycYbJe6oAW
	 DH0oECjBENuEmmG9AaTzfDOdtEqjVaa6sdlRdmFdbG5Y+/V76Ls/UdCtiNo1wCkVba
	 spz5uwEZvWphnUiJlRaLISgGYNIvjEvmFoKc+sIbCwZUQjFEvd455+jDdILJO/lnpY
	 /YrKQxFjNbkviP25G4uah5q1oSP5YCX214uZ/KXybsTkDLyHXg+40oeHxXAtoglljd
	 5Ch5A6AZMmNpEXqBrbaIbx4N0/N/pj599/qFQkxerzOLAKtBaxGX7UnLB+EQz5+Gza
	 MEuL78Hxog/fA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] i3c: dw: use COMMAND_PORT_TRANSFER_ARG instead of
 hardcoding
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: linux-i3c@lists.infradead.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org
In-Reply-To: <20260813044225.22237-1-jszhang@kernel.org>
References: <20260813044225.22237-1-jszhang@kernel.org>
Date: Thu, 13 Aug 2026 05:10:34 +0000
Message-Id: <20260813051034.F2D511F00A3A@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtIaWdoXSBNaXNzaW5nIGNoZWNrIGZvciB0aGUgdHJhbnNmZXIgZXJyb3Igc3RhdHVzIGFuZCB0
aW1lb3V0IGluIGBkd19pM2NfbWFzdGVyX2RhYSgpYCBsZWFkcyB0byBpbmNvcnJlY3RseSByZWdp
c3RlcmluZyBnaG9zdCBkZXZpY2VzIG9uIGFuIGVtcHR5IGJ1cyBvciB1cG9uIGhhcmR3YXJlIGZh
aWx1cmUuCi0tCgotLS0gUGF0Y2ggWzFdOiBbUEFUQ0hdIGkzYzogZHc6IHVzZSBDT01NQU5EX1BP
UlRfVFJBTlNGRVJfQVJHIGluc3RlYWQgb2YgaGFyZGNvZGluZyAtLS0KY29tbWl0IDIyOTk4ZjZi
YmNiNDRkNjAwZTIzY2QxN2YxZTZjNWI0OGQyNjhlMzEKQXV0aG9yOiBKaXNoZW5nIFpoYW5nIDxq
c3poYW5nQGtlcm5lbC5vcmc+CgppM2M6IGR3OiB1c2UgQ09NTUFORF9QT1JUX1RSQU5TRkVSX0FS
RyBpbnN0ZWFkIG9mIGhhcmRjb2RpbmcKClRoaXMgY29tbWl0IHJlcGxhY2VzIHRoZSBoYXJkY29k
ZWQgdmFsdWUgMSB3aXRoIHRoZSB3ZWxsIGRlZmluZWQKQ09NTUFORF9QT1JUX1RSQU5TRkVSX0FS
RyBtYWNyby4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVy
LmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jCj4gaW5kZXggNDA1MDg5ZjE4
MWM0ZC4uNzAzOGFhM2JmNGM3ZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIvZHct
aTNjLW1hc3Rlci5jCj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL2R3LWkzYy1tYXN0ZXIuYwo+
IEBAIC05MjEsNyArOTIxLDcgQEAgc3RhdGljIGludCBkd19pM2NfbWFzdGVyX2RhYShzdHJ1Y3Qg
aTNjX21hc3Rlcl9jb250cm9sbGVyICptKQo+ICAJCWdvdG8gcnBtX291dDsKPiAgCX0KPiAgCWNt
ZCA9ICZ4ZmVyLT5jbWRzWzBdOwo+IC0JY21kLT5jbWRfaGkgPSAweDE7Cj4gKwljbWQtPmNtZF9o
aSA9IENPTU1BTkRfUE9SVF9UUkFOU0ZFUl9BUkc7Cj4gIAljbWQtPmNtZF9sbyA9IENPTU1BTkRf
UE9SVF9ERVZfQ09VTlQobWFzdGVyLT5tYXhkZXZzIC0gcG9zKSB8Cj4gIAkJICAgICAgQ09NTUFO
RF9QT1JUX0RFVl9JTkRFWChwb3MpIHwKPiAgCQkgICAgICBDT01NQU5EX1BPUlRfQ01EKEkzQ19D
Q0NfRU5UREFBKSB8CgpbIC4uLiBdCgo+ICAJZHdfaTNjX21hc3Rlcl9lbnF1ZXVlX3hmZXIobWFz
dGVyLCB4ZmVyKTsKPiAgCWlmICghd2FpdF9mb3JfY29tcGxldGlvbl90aW1lb3V0KCZ4ZmVyLT5j
b21wLCBYRkVSX1RJTUVPVVQpKQo+ICAJCWR3X2kzY19tYXN0ZXJfZGVxdWV1ZV94ZmVyKG1hc3Rl
ciwgeGZlcik7Cj4gIAo+ICAJLyoKPiAgCSAqIGNtZC0+cnhfbGVuIGhvbGRzIHRoZSBudW1iZXIg
b2YgYWRkcmVzc2VzIEVOVERBQSBsZWZ0IHVuYXNzaWduZWQuCj4gIAkgKiBPbiBhbiBlbXB0eSBi
dXMgcnhfbGVuID09IG1heGRldnMsIHNvIGF2b2lkIEdFTk1BU0soLTEsIDApLgo+ICAJICovCj4g
IAlpZiAoY21kLT5yeF9sZW4gPj0gbWFzdGVyLT5tYXhkZXZzKQo+ICAJCW5ld2RldnMgPSAwOwo+
ICAJZWxzZQo+ICAJCW5ld2RldnMgPSBHRU5NQVNLKG1hc3Rlci0+bWF4ZGV2cyAtIGNtZC0+cnhf
bGVuIC0gMSwgMCk7CgpbU2V2ZXJpdHk6IEhpZ2hdClRoaXMgaXMgYSBwcmUtZXhpc3RpbmcgaXNz
dWUsIGJ1dCBJIG5vdGljZWQgYSBwb3RlbnRpYWwgcHJvYmxlbSBpbiBob3cKdHJhbnNmZXIgZXJy
b3JzIGFuZCB0aW1lb3V0cyBhcmUgaGFuZGxlZCBoZXJlIGluIGR3X2kzY19tYXN0ZXJfZGFhKCku
CgpJZiB3YWl0X2Zvcl9jb21wbGV0aW9uX3RpbWVvdXQoKSB0aW1lcyBvdXQgZHVlIHRvIGEgbm9p
c3kgb3IgdW5yZXNwb25zaXZlCkkzQyBidXMsIHRoZSBjb21wbGV0aW9uIHRpbWVvdXQgYW5kIGFu
eSBoYXJkd2FyZSB0cmFuc2ZlciBlcnJvcnMgYXBwZWFyIHRvCmJlIGlnbm9yZWQuCgpJbiBhIHRp
bWVvdXQgc2NlbmFyaW8sIGNtZC0+cnhfbGVuIHJlbWFpbnMgMC4gVGhlIGNvZGUgdGhlbiBmYWxs
cyB0aHJvdWdoCmFuZCBjYWxjdWxhdGVzIG5ld2RldnMgPSBHRU5NQVNLKC4uLikgdXNpbmcgdGhh
dCB6ZXJvIHZhbHVlLgoKQ291bGQgdGhpcyBjYXVzZSB0aGUgZHJpdmVyIHRvIGluY29ycmVjdGx5
IGludGVycHJldCB0aGUgdGltZW91dCBhcyBhCnN1Y2Nlc3NmdWwgZGlzY292ZXJ5IG9mIGRldmlj
ZXMgZm9yIGFsbCBmcmVlIHNsb3RzLCBsZWFkaW5nIGl0IHRvIHJlZ2lzdGVyCnBoYW50b20gZGV2
aWNlcz8KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0
Y2hzZXQvMjAyNjA4MTMwNDQyMjUuMjIyMzctMS1qc3poYW5nQGtlcm5lbC5vcmc/cGFydD0xCgot
LSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
