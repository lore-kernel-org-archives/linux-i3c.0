Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E2DC27C5E
	for <linux-i3c@archiver.kernel.org>; Fri,  7 Jun 2024 02:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NsVnSAR9wEuObHXfflL3/OAN7kqR/gIE+ktLAAwvoiU=; b=GoZlneF091yF4G
	EGBc7AWevHzqsAnQ82fXHt0CosTeLz0+isN48indyLOCZ8EcX7PyZ8UOV1N6QjTEhUgRXR5T/teHV
	4fIbsrPSzgcvy9EhUZWir6BmbZfFcVg6t2OlDhs3S5WbeR8MWqdbNqfKMpRpS+l8plNfj3AxSC98Q
	tl2KgevEKAANgFev04rziHtIk5SCKwakgjjjC/fgJV5Lh92YOUsRqH4pNaEuCYrKdGGUGWZuJDFLh
	pXUaAXEncwT9xzgLCLdt0f26vFg2qagPGCkylqL5cGMuwZN1sOKsvfci5LAUlKMYYORrY6SCBjEBO
	i/C+/KlB5jlzKL25rMYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFPLd-0000000C574-1egp;
	Fri, 07 Jun 2024 02:28:57 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFPLa-0000000C56O-0TJ8
	for linux-i3c@lists.infradead.org;
	Fri, 07 Jun 2024 02:28:56 +0000
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 350C320075;
	Fri,  7 Jun 2024 10:28:37 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1717727319;
	bh=NR2BjMyojSNVzVA3wiNKVKPivX6F/0FiMK6KwEP4tQk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=cWqA0PGAUe9qogFTf92p1oVZmk3M3KWt/YqFP1tdjnrTYq6jOfOdCO/E9lMKnGeEo
	 nDH0uKjE1yDtGg4z7TCjPeODlO0Goy3esRjN1sp0IH/c1Rry1mXBh4fZI9SkLHAB+P
	 cWu5/8Ve1EeiiC9nApqJIKJtqxJCkWgaEzAn5ptIA/yoD2P0/vtKympeAScFDJq8wJ
	 +4OD3qfGntNYUIyFkV6mnAo4QsQ8qzDQ5jTolyAeOUQmi7qtFUSW7F32arbckTMewR
	 sJiN6a6TafVyoW5jWwYPvZuOXS3xXru/KBpq3T78BICSozOmdZwxbe4U2J1yiEKEbM
	 MCMiGnRfreOxQ==
Message-ID: <3c6c319f3aaa60428fd28f4d95c71dc9a8150081.camel@codeconstruct.com.au>
Subject: Re: [PATCH] i3c: dw: Fix IBI intr signal programming
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Aniket <aniketmaurya@google.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>, Joel Stanley <joel@jms.id.au>, Billy Tsai
	 <billy_tsai@aspeedtech.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 07 Jun 2024 10:28:42 +0800
In-Reply-To: <20240606124816.723630-1-aniketmaurya@google.com>
References: <20240606124816.723630-1-aniketmaurya@google.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_192854_384696_569BF658 
X-CRM114-Status: GOOD (  13.50  )
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

SGkgQW5pa2V0LAoKPiBJQklfU0lSX1JFUV9SRUpFQ1QgcmVnaXN0ZXIgaXMgbm90IHByZXNlbnQg
aWYgdGhlIElQCj4gaGFzIElDX0hBU19JQklfREFUQSA9IDEgc2V0LgoKSSBkb24ndCBoYXZlIGFu
eSBhY2Nlc3MgdG8gdGhlIElQIGl0c2VsZiwgYnV0IEkgdW5kZXJzdGFuZCB0aGVyZSBhcmUgYQpm
ZXcgZGlmZmVyZW50IGNvbmZpZ3VyYXRpb24gc2V0dGluZ3MgaW4gdGhlIElQIHRoYXQgbWF5IGFm
ZmVjdCB0aGUKcmVnaXN0ZXIgaW50ZXJmYWNlLgoKSSB0aGluayB3ZSdyZSBPSyBpbiB0aGlzIGNh
c2UgKGp1c3Qgbm90IHJlYWRpbmcgdGhlIHZhbHVlIG91dCBvZiB0aGUKU0lSX1JFUV9SRUpFQ1Qg
cmVnaXN0ZXIpLCBidXQgYW55IHRob3VnaHRzIG9uIGFkZGluZyBjb3JyZXNwb25kaW5nCnN3aXRj
aGVzIGluIHRoZSBkcml2ZXIgc28gd2UgY2FuIHN1cHBvcnQgdGhvc2UgY29uZmlndXJhdGlvbnM/
IFRoZXNlCndvdWxkIGJlIHJlcHJlc2VudGVkIGFzIERUIGNvbmZpZyBvZiB0aGUgc3BlY2lmaWMg
aGFyZHdhcmUgaW5zdGFuY2UgLSBhdAp0aGUgbW9zdCBncmFudWxhciwganVzdCBieSB0aGUgc3Bl
Y2lmaWMgY29tcGF0aWJsZSBzdHJpbmcuCgo+IGR3X2kzY19tYXN0ZXJfc2V0X3Npcl9lbmFibGVk
KHN0cnVjdCBkd19pM2NfbWFzdGVyICptYXN0ZXIsCj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgcmVn
ID0gcmVhZGwobWFzdGVyLT5yZWdzICsgSUJJX1NJUl9SRVFfUkVKRUNUKTsKPiDCoMKgwqDCoMKg
wqDCoMKgaWYgKGVuYWJsZSkgewo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnbG9i
YWwgPSByZWcgPT0gMHhmZmZmZmZmZjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
Z2xvYmFsID0gIW1hc3Rlci0+c2lyX2VuX2NudCsrOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgcmVnICY9IH5CSVQoaWR4KTsKPiDCoMKgwqDCoMKgwqDCoMKgfSBlbHNlIHsKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJvb2wgaGpfcmVqZWN0ZWQgPSAhIShyZWFk
bChtYXN0ZXItPnJlZ3MgKyBERVZJQ0VfQ1RSTCkgJiBERVZfQ1RSTF9IT1RfSk9JTl9OQUNLKTsK
PiDCoAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVnIHw9IEJJVChpZHgpOwo+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnbG9iYWwgPSAocmVnID09IDB4ZmZmZmZm
ZmYpICYmIGhqX3JlamVjdGVkOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnbG9i
YWwgPSAoIS0tbWFzdGVyLT5zaXJfZW5fY250KSAmJiBoal9yZWplY3RlZDsKPiDCoMKgwqDCoMKg
wqDCoMKgfQoKQ291bGQgd2UgdXNlIHRoZSBTSVIgbWFzayBmb3IgdGhpcywgYnV0IGp1c3QgcmVh
ZCBpdCBmcm9tIGEgZmllbGQgaW4gdGhlCnN0cnVjdCBkd19pM2NfbWFzdGVyLCBpbnN0ZWFkIG9m
IElCSV9TSVJfUkVRX1JFSkVDVD8KClRoaXMgd291bGQgbWVhbiB0aGF0IHRoZXJlJ3Mgbm8gcG9z
c2liaWxpdHkgb2YgdGhlIGNvdW50ZXIgZ29pbmcgb3V0IG9mCnN5bmMgZnJvbSB0aGUgU0lSIHNl
dHRpbmdzIC0gc2F5LCBvbiB1bmRlcmZsb3cgaWYgd2UgZ2V0IGEgc3B1cmlvdXMKZGlzYWJsZS4K
CkNoZWVycywKCgpKZXJlbXkKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1pM2MK
