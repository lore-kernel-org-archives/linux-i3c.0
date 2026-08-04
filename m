Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E23EC55172
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Aug 2026 10:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z5bQc7GWBME3q/qf+u8Z9BMGoPKMQB6LONVQp3MwNr8=; b=Zuda7T1z9KdOve
	Tl4yX7QHc7Iz//D3rw/9AfWYoWUgQSS1m3Q7PBeyN+Ck32T1W2+vbpHZOlgpeeXDkz3gYpPkfBbyY
	pSUF6W9Ca9C/JMdiKEDYwzpxOTZFm2ByjRF58JzQeG1an3n/45xwKTExSbd7RHZqJqTXCiswJ7gGQ
	HnystSQ1z/GZp+CFHqBdpN88RBYE7qy6wt/j7dCLixDSH3tIIOwcXMvwD/iRG1SiyTswnpEyaoZrJ
	rnsjyGF+U8sDxoKR9sZutOVCqAAiDmxCS+44fxZsmVtaO+u7WvXz8zp06mycFC6imBiQZ6eHNMDQA
	//Ob35bAm5i1vLRzlBlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrCSM-00000001Y8A-2HkL;
	Tue, 04 Aug 2026 10:33:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrCSL-00000001Y7j-0Nqv
	for linux-i3c@lists.infradead.org;
	Tue, 04 Aug 2026 10:33:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E13160A71;
	Tue,  4 Aug 2026 10:33:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A89B81F000E9;
	Tue,  4 Aug 2026 10:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785839587;
	bh=l/Tv3DlbJKcnAf/e46bK0z0lSzda5Kj8/mut5a7lC7Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XAueDH5v3CxOtel35uTAcNbM3Sd5knX7j1h/LNLAMNegCtmC0oaddAQ+LkY7IWj89
	 ITbaMosi43vh9mkHTQLaCT2GoYkzkNdl2wCxX3JHSCCej6tR1oWm2KZNOkh1Rldctv
	 3xxAlWDtOJJ3yfEC7tXxI4wx5vVNye8q91D4CNscps7EXDAROZVUg8Q5Bpqk4aaVXG
	 2uqw4ppuHnGxU9o7jNai6haNLKG7RktT18/ch2UvzdKBU1kMdyRatdJSwneKx7xqvo
	 YFM9I1tRXsZ0S3hl1n/oL6AlY/7F7oRLqnCkp61rnuU+L03P05QBH2JO8Ob3/zPW27
	 fTl4PjbtyXPjw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] i3c: master: Release the fwnode of i2c boardinfo
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org
In-Reply-To: <20260804101301.2975911-2-akhilrajeev@nvidia.com>
References: <20260804101301.2975911-1-akhilrajeev@nvidia.com>
 <20260804101301.2975911-2-akhilrajeev@nvidia.com>
Date: Tue, 04 Aug 2026 10:33:05 +0000
Message-Id: <20260804103306.A89B81F000E9@smtp.kernel.org>
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
IFtIaWdoXSBUaGUgcGF0Y2ggZml4ZXMgYSBmd25vZGUgcmVmZXJlbmNlIGxlYWsgaW4gYGkzY19t
YXN0ZXJfYWRkX2kyY19ib2FyZGluZm8oKWAgYnV0IGNvbXBsZXRlbHkgbWlzc2VzIHRoZSBpZGVu
dGljYWwgbGVhayBpbiBgaTNjX21hc3Rlcl9hZGRfaTNjX2JvYXJkaW5mbygpYC4gRnVydGhlcm1v
cmUsIHRoZXJlIGlzIGEgc3RydWN0dXJhbCBsaWZlY3ljbGUgZmxhdzogYGkzY19tYXN0ZXJfcmVn
aXN0ZXJfbmV3X2kzY19kZXZzKClgIGFzc2lnbnMgdGhlIGJvYXJkaW5mbydzIGZ3bm9kZSB0byB0
aGUgbmV3IEkzQyBkZXZpY2Ugd2l0aG91dCB0YWtpbmcgYSByZWZlcmVuY2UsIGFuZCBgaTNjX2Rl
dmljZV9yZWxlYXNlKClgIHVuY29uZGl0aW9uYWxseSBkcm9wcyBpdC4gVGhpcyBtZWFucyBpZiBv
bmUgbWVyZWx5IGJsaW5kbHkgY29waWVzIHRoZSBkZXZtIGZpeCB0byBgaTNjX21hc3Rlcl9hZGRf
aTNjX2JvYXJkaW5mbygpYCwgaXQgd291bGQgdHJpZ2dlciBhIGRvdWJsZS1wdXQgVUFGIGZvciBp
bnN0YW50aWF0ZWQgZGV2aWNlcy4gVG8gZml4IHRoZSBzdWJzeXN0ZW0gZnVsbHksIGJvdGggdGhl
IGRldm0gYWN0aW9uIG11c3QgYmUgYWRkZWQgYW5kIGEgYGZ3bm9kZV9oYW5kbGVfZ2V0KClgIG11
c3QgYmUgdGFrZW4gaW4gYGkzY19tYXN0ZXJfcmVnaXN0ZXJfbmV3X2kzY19kZXZzKClgLgotLQoK
LS0tIFBhdGNoIFsxXTogW1BBVENIIDEvNV0gaTNjOiBtYXN0ZXI6IFJlbGVhc2UgdGhlIGZ3bm9k
ZSBvZiBpMmMgYm9hcmRpbmZvIC0tLQpjb21taXQgOWI3ZTdlNWRkMTViODBkMjMwZmMwZTUyYzRk
N2I4ZWY5ZGVhMTZjOQpBdXRob3I6IEFraGlsIFIgPGFraGlscmFqZWV2QG52aWRpYS5jb20+Cgpp
M2M6IG1hc3RlcjogUmVsZWFzZSB0aGUgZndub2RlIG9mIGkyYyBib2FyZGluZm8KClRoaXMgY29t
bWl0IGZpeGVzIGEgZndub2RlIHJlZmVyZW5jZSBsZWFrIGluIGkzY19tYXN0ZXJfYWRkX2kyY19i
b2FyZGluZm8oKS4KSXQgYWRkcyBhIGRldm0gYWN0aW9uIHRvIGF1dG9tYXRpY2FsbHkgZHJvcCB0
aGUgZmlybXdhcmUgbm9kZSByZWZlcmVuY2UgdGFrZW4KZm9yIGV2ZXJ5IEkyQyBjaGlsZCBkZXZp
Y2Ugd2hlbiB0aGUgY29udHJvbGxlciBkZXZpY2UgaXMgdW5ib3VuZC4KCkNsb3NlczogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzk3NDY1ODkzLTM2NTAtNGYzNy05OGI3LTFkYjc2ZmM2ZmQw
M0BpbnRlbC5jb20vCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYyBiL2RyaXZl
cnMvaTNjL21hc3Rlci5jCj4gaW5kZXggZjQ4NWI5ODgwNWNmNi4uMDhkYzEwZjE3MmFhYiAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYwo+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rl
ci5jCj4gQEAgLTI5MTMsNyArMjkxOCw4IEBAIGkzY19tYXN0ZXJfYWRkX2kyY19ib2FyZGluZm8o
c3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAqbWFzdGVyLAo+ICAJbGlzdF9hZGRfdGFpbCgm
Ym9hcmRpbmZvLT5ub2RlLCAmbWFzdGVyLT5ib2FyZGluZm8uaTJjKTsKPiAgCWZ3bm9kZV9oYW5k
bGVfZ2V0KGZ3bm9kZSk7Cj4gIAo+IC0JcmV0dXJuIDA7Cj4gKwlyZXR1cm4gZGV2bV9hZGRfYWN0
aW9uX29yX3Jlc2V0KGRldiwgaTNjX21hc3Rlcl9wdXRfYm9hcmRpbmZvX2Z3bm9kZSwKPiArCQkJ
CQlmd25vZGUpOwo+ICB9CgpbU2V2ZXJpdHk6IEhpZ2hdClRoaXMgaXMgYSBwcmUtZXhpc3Rpbmcg
aXNzdWUsIGJ1dCB3aGlsZSBmaXhpbmcgdGhlIGxlYWsgZm9yIEkyQyBkZXZpY2VzLCBpdCAKbG9v
a3MgbGlrZSB0aGUgaWRlbnRpY2FsIGxlYWsgd2FzIGxlZnQgYmVoaW5kIGluIHRoZSBJM0MgY291
bnRlcnBhcnQsIAppM2NfbWFzdGVyX2FkZF9pM2NfYm9hcmRpbmZvKCkuCgpIb3dldmVyLCB3b3Vs
ZCBhcHBseWluZyB0aGUgc2FtZSBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoKSBmaXggdGhlcmUK
dHJpZ2dlciBhIGRvdWJsZS1wdXQgdXNlLWFmdGVyLWZyZWUgZm9yIGluc3RhbnRpYXRlZCBJM0Mg
ZGV2aWNlcz8KCkxvb2tpbmcgYXQgaG93IHRoZSBJM0MgZGV2aWNlcyBhcmUgY3JlYXRlZCwgaTNj
X21hc3Rlcl9yZWdpc3Rlcl9uZXdfaTNjX2RldnMoKQphc3NpZ25zIHRoZSBib2FyZGluZm8gZndu
b2RlIHRvIHRoZSBuZXcgZGV2aWNlIHdpdGhvdXQgdGFraW5nIGFuIGFkZGl0aW9uYWwKcmVmZXJl
bmNlOgoKZHJpdmVycy9pM2MvbWFzdGVyLmM6aTNjX21hc3Rlcl9yZWdpc3Rlcl9uZXdfaTNjX2Rl
dnMoKSB7CiAgICAuLi4KICAgIGRldmljZV9zZXRfbm9kZSgmZGVzYy0+ZGV2LT5kZXYsIGRlc2Mt
PmJvYXJkaW5mby0+Zndub2RlKTsKICAgIC4uLgp9CgpBbmQgd2hlbiB0aGUgZGV2aWNlIGlzIHVu
cmVnaXN0ZXJlZCwgaTNjX2RldmljZV9yZWxlYXNlKCkgdW5jb25kaXRpb25hbGx5CmRyb3BzIGl0
OgoKZHJpdmVycy9pM2MvbWFzdGVyLmM6aTNjX2RldmljZV9yZWxlYXNlKCkgewogICAgLi4uCiAg
ICBmd25vZGVfaGFuZGxlX3B1dChkZXYtPmZ3bm9kZSk7CiAgICAuLi4KfQoKSWYgYSBkZXZtIGFj
dGlvbiBpcyBhZGRlZCB0byBpM2NfbWFzdGVyX2FkZF9pM2NfYm9hcmRpbmZvKCkgdG8gZHJvcCB0
aGUKcmVmZXJlbmNlIG9uIHRlYXJkb3duLCB3b3VsZG4ndCB3ZSBhbHNvIG5lZWQgdG8gYWRkIGEg
Zndub2RlX2hhbmRsZV9nZXQoKQppbiBpM2NfbWFzdGVyX3JlZ2lzdGVyX25ld19pM2NfZGV2cygp
IHRvIGVuc3VyZSBpM2NfZGV2aWNlX3JlbGVhc2UoKQpkb2Vzbid0IGNvbnN1bWUgdGhlIHJlZmVy
ZW5jZSB0aGUgZGV2bSBhY3Rpb24gZXhwZWN0cyB0byBkcm9wPwoKLS0gClNhc2hpa28gQUkgcmV2
aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDgwNDEwMTMwMS4yOTc1
OTExLTEtYWtoaWxyYWplZXZAbnZpZGlhLmNvbT9wYXJ0PTEKCi0tIApsaW51eC1pM2MgbWFpbGlu
ZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
