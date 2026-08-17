Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CAFC5B572
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Aug 2026 10:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pNRi+TREMOdLz8mUC0vQ9zVQFmul4TQ4PqWrsVFPuR4=; b=YkEAxoUHhPiLYZ
	UJ6SassR0EAjH+r85KMDPB1fMIagMEbn+Yk5KSDO1xk7rXmKmi8eVw4bc4aNeY1EmsT/BtkplFVYI
	zLgo+RmeQZGHn1idpq78G7tvutIwB4zcwsauz/gtebA7URJDfZF+HkzDTi09wmYYqOIbR5kYyYZS7
	RXo799RB2l8HdmPiJ3K0NbvhUZ3rOCs0IHiqn6zYejg8PKw9JF+JCRoai7TZMvA9vpSNcrE8bDu7j
	R3mfhkJt1+mOXhXRU5aBV1XTMjLz+KHp+HV4o5n5kSM1wtaLTHUt0q15BbNvgHDx3BVfz8fzUsKpi
	92dpDpDJR0VfNoLS5Tdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvuwh-00000005y0X-0SDV;
	Mon, 17 Aug 2026 10:51:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvuwg-00000005y0R-05mW
	for linux-i3c@lists.infradead.org;
	Mon, 17 Aug 2026 10:51:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C58C24324F;
	Mon, 17 Aug 2026 10:51:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 694101F000E9;
	Mon, 17 Aug 2026 10:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786963917;
	bh=cwTZWVep+3N+gGDg3SnldGUgkZb3fUelXvWMx/uE0z0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jDBMFoqb/eaV2Z6ayEkz7YR1r6bN/C6+m4xOvK7xIb1GZsuISvLdmFq34+FHf4Xd+
	 vpBIsdFBE8bHX0EwE/07KAaUN611IjjIqcFgK/PZLImH5cvJnyGZqLwgjov6+iLRI1
	 m5JzlTEhNtAZKEj4px0AnEnYMolQQddnylPJH72+x+gsXl4uV437SXQe3EB19jf68Q
	 xsJ2zYdERM03Odh1Bcq54XJ8UJ81nU+P/RiZrdOLkjpPQB4iYDNNjf3+KVSF4cfoYo
	 TeXxU1Or/NhOhi7g1w5GpG4+XMFDt0hAJBQFRWTb8VSFZaSYxHSZDUHC5F9H9LD1Cv
	 UwVGAvfznm/ww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 5/8] regulator: p3h2x4x: Add driver for on-die
 regulators in NXP P3H2x4x i3c hub
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-i3c@lists.infradead.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org
In-Reply-To: <20260817103844.2142802-6-lakshay.piplani@nxp.com>
References: <20260817103844.2142802-1-lakshay.piplani@nxp.com>
 <20260817103844.2142802-6-lakshay.piplani@nxp.com>
Date: Mon, 17 Aug 2026 10:51:57 +0000
Message-Id: <20260817105157.694101F000E9@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gTUZEIHN1YnN5c3Rl
bSBndWlkZSB2aW9sYXRpb246IGRyaXZlci1zcGVjaWZpYyBoZWFkZXIgaW4gZ2xvYmFsIGluY2x1
ZGUgZGlyZWN0b3J5IGFuZCB1c2Ugb2YgYmVzcG9rZSBwYXJlbnQgY29udGV4dCBzdHJ1Y3R1cmUu
Ci0gW0xvd10gVGhlIGBwM2gyeDR4X3JlZ3VsYXRvcnNgIGFycmF5IG9mIHJlZ3VsYXRvciBkZXNj
cmlwdG9ycyBpcyBub3QgbWFya2VkIGBjb25zdGAuCi0tCgotLS0gUGF0Y2ggWzVdOiBbUEFUQ0gg
djE1IDUvOF0gcmVndWxhdG9yOiBwM2gyeDR4OiBBZGQgZHJpdmVyIGZvciBvbi1kaWUgcmVndWxh
dG9ycyBpbiBOWFAgUDNIMng0eCBpM2MgaHViIC0tLQpjb21taXQgNmJkNWNlZDQzYmQ3MDgwNGM3
NzIyMjdmZGUwYzU1Mzk1MzQxYzc3ZApBdXRob3I6IEFtYW4gS3VtYXIgUGFuZGV5IDxhbWFuLmt1
bWFycGFuZGV5QG54cC5jb20+CgpyZWd1bGF0b3I6IHAzaDJ4NHg6IEFkZCBkcml2ZXIgZm9yIG9u
LWRpZSByZWd1bGF0b3JzIGluIE5YUCBQM0gyeDR4IGkzYyBodWIKClRoaXMgcGF0Y2ggaW50cm9k
dWNlcyBhIG5ldyByZWd1bGF0b3IgZHJpdmVyIGZvciB0aGUgTlhQIFAzSDJ4NHggSTNDIGh1Yi4g
SXQKcmVnaXN0ZXJzIHRoZSBMRE9zIHVzaW5nIHRoZSBNRkQgZnJhbWV3b3JrIGFuZCBleHBvc2Vz
IHRoZW0gdmlhIHRoZSByZWd1bGF0b3IKc3Vic3lzdGVtLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9yZWd1bGF0b3IvcDNoMjg0MF9pM2NfaHViX3JlZ3VsYXRvci5jIGIvZHJpdmVycy9yZWd1bGF0
b3IvcDNoMjg0MF9pM2NfaHViX3JlZ3VsYXRvci5jCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBp
bmRleCAwMDAwMDAwMDAwMDAwLi42NDVkNDZhZDdjMmYyCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBi
L2RyaXZlcnMvcmVndWxhdG9yL3AzaDI4NDBfaTNjX2h1Yl9yZWd1bGF0b3IuYwo+IEBAIC0wLDAg
KzEsMjg0IEBACj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4gKy8qCj4g
KyAqIENvcHlyaWdodCAyMDI1LTIwMjYgTlhQCj4gKyAqIE5YUCBQM0gyWDRYIHJlZ3VsYXRvciBk
cml2ZXIgZmlsZSBjb250YWluIGZ1bmN0aW9ucyBmb3IgZW5hYmxlL2Rpc2FibGUgcmVndWxhdG9y
Cj4gKyAqIGFuZCB2b2x0YWdlIHNldC9nZXQuCj4gKyAqLwo+ICsjaW5jbHVkZSA8bGludXgvYml0
ZmllbGQuaD4KPiArI2luY2x1ZGUgPGxpbnV4L2NsZWFudXAuaD4KPiArI2luY2x1ZGUgPGxpbnV4
L21mZC9wM2gyODQwLmg+CgpbU2V2ZXJpdHk6IE1lZGl1bV0KU2hvdWxkIHRoaXMgaGVhZGVyIGJl
IGtlcHQgbG9jYWwgdG8gZHJpdmVycy9tZmQvIGluc3RlYWQgb2YgcGxhY2luZyBpdCBpbiB0aGUK
Z2xvYmFsIGluY2x1ZGUvbGludXgvbWZkLyBkaXJlY3Rvcnk/IFRoZSBNRkQgc3Vic3lzdGVtIGd1
aWRlbGluZXMgcmVjb21tZW5kCmFnYWluc3QgcGxhY2luZyBkcml2ZXItc3BlY2lmaWMgaGVhZGVy
IGZpbGVzIGluIHRoZSBnbG9iYWwgaW5jbHVkZSBkaXJlY3RvcnkKaWYgdGhleSBhcmUgb25seSB1
c2VkIGJ5IHRoZSBwYXJlbnQgYW5kIGl0cyBpbW1lZGlhdGUgY2hpbGRyZW4uCgo+ICsjaW5jbHVk
ZSA8bGludXgvb2YuaD4KPiArI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgo+ICsj
aW5jbHVkZSA8bGludXgvcmVnbWFwLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9yZWd1bGF0b3IvZHJp
dmVyLmg+CgpbIC4uLiBdCgo+ICtzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IHAzaDJ4NHhfdm9s
dGFnZV90YWJsZVtdID0gewo+ICsJMTAwMDAwMCwKPiArCTExMDAwMDAsCj4gKwkxMjAwMDAwLAo+
ICsJMTgwMDAwMCwKPiArfTsKPiArCj4gK3N0YXRpYyBzdHJ1Y3QgcmVndWxhdG9yX2Rlc2MgcDNo
Mng0eF9yZWd1bGF0b3JzW10gPSB7CgpbU2V2ZXJpdHk6IExvd10KQ291bGQgdGhpcyBhcnJheSBi
ZSBtYXJrZWQgY29uc3Q/IEJlY2F1c2UgZGV2bV9yZWd1bGF0b3JfcmVnaXN0ZXIoKSBhY2NlcHRz
IGEKY29uc3Qgc3RydWN0IHJlZ3VsYXRvcl9kZXNjIHBvaW50ZXIsIG1ha2luZyB0aGlzIGFycmF5
IGNvbnN0IHdvdWxkIG1vdmUgaXQgdG8KdGhlIHJlYWQtb25seSAucm9kYXRhIHNlY3Rpb24uCgo+
ICsJewo+ICsJCS5uYW1lID0gImxkby1jcDAiLAo+ICsJCS5vZl9tYXRjaCA9IG9mX21hdGNoX3B0
cigibGRvLWNwMCIpLAo+ICsJCS5yZWd1bGF0b3JzX25vZGUgPSBvZl9tYXRjaF9wdHIoInJlZ3Vs
YXRvcnMiKSwKClsgLi4uIF0KCj4gKwl7Cj4gKwkJLm5hbWUgPSAibGRvLXRwZzEiLAo+ICsJCS5v
Zl9tYXRjaCA9IG9mX21hdGNoX3B0cigibGRvLXRwZzEiKSwKPiArCQkucmVndWxhdG9yc19ub2Rl
ID0gb2ZfbWF0Y2hfcHRyKCJyZWd1bGF0b3JzIiksCj4gKwkJLnZvbHRfdGFibGUgPSBwM2gyeDR4
X3ZvbHRhZ2VfdGFibGUsCj4gKwkJLm5fdm9sdGFnZXMgPSBBUlJBWV9TSVpFKHAzaDJ4NHhfdm9s
dGFnZV90YWJsZSksCj4gKwkJLm9wcyA9ICZwM2gyeDR4X2xkb19vcHMsCj4gKwkJLnR5cGUgPSBS
RUdVTEFUT1JfVk9MVEFHRSwKPiArCQkub3duZXIgPSBUSElTX01PRFVMRSwKPiArCQkuZW5hYmxl
X3JlZyA9IFAzSDJYNFhfTERPX0FORF9QVUxMVVBfQ09ORiwKPiArCQkuZW5hYmxlX21hc2sgPSBQ
M0gyWDRYX1RQMjM2N19FTl9MRE8sCj4gKwkJLnZzZWxfcmVnID0gUDNIMlg0WF9WQ0NJT19MRE9f
Q09ORiwKPiArCQkudnNlbF9tYXNrID0gUDNIMlg0WF9UUDIzNjdfVkNDSU9fTERPX1ZPTFRBR0Vf
TUFTSywKPiArCX0sCj4gK307Cj4gKwo+ICtzdGF0aWMgaW50IHAzaDJ4NHhfcmVndWxhdG9yX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gK3sKPiArCXN0cnVjdCBwM2gyeDR4
ICpwM2gyeDR4ID0gZGV2X2dldF9kcnZkYXRhKHBkZXYtPmRldi5wYXJlbnQpOwoKW1NldmVyaXR5
OiBNZWRpdW1dCklzIGl0IHBvc3NpYmxlIHRvIHVzZSBzdGFuZGFyZCBBUElzIHRvIGFjY2VzcyB0
aGUgcmVxdWlyZWQgc3RhdGUgcmF0aGVyIHRoYW4KZXhwb3NpbmcgdGhlIGJlc3Bva2UgcGFyZW50
IHN0cnVjdCBwM2gyeDR4IHRvIHRoZSBjaGlsZCBkcml2ZXJzPyAKClRoZSBNRkQgc3Vic3lzdGVt
IGd1aWRlbGluZXMgZGlzY291cmFnZSBleHBvc2luZyBiZXNwb2tlIHBhcmVudCBzdHJ1Y3R1cmVz
IGZvcgpwYXJlbnQtY2hpbGQgZGF0YSBzaGFyaW5nIHRvIG1haW50YWluIHByb3BlciBsYXllcmlu
Zy4KCj4gKwlzdHJ1Y3QgcDNoMng0eF9yZWd1bGF0b3JfZGV2ICpwM2gyeDR4X3JlZ3VsYXRvcjsK
PiArCXN0cnVjdCByZWd1bGF0b3JfY29uZmlnIHJjZmcgPSB7IH07Cj4gKwlzdHJ1Y3QgZGV2aWNl
ICpkZXYgPSAmcGRldi0+ZGV2OwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2Fz
aGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDgxNzEwMzg0NC4yMTQyODAyLTEtbGFrc2hheS5waXBs
YW5pQG54cC5jb20/cGFydD01CgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWkzYwo=
