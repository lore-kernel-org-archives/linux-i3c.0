Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCF3C88E71
	for <linux-i3c@archiver.kernel.org>; Mon, 14 Sep 2026 11:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2wZrRCHe5J8Y+kDJQegFbdG3pdB6qwvIWLPUods7aU0=; b=WFg2Zj659B87fG
	Et+hwb8QxWiDuUHWD5XAMXdfqbVoexWMbxICMt8S102jEOirTXI0lhl0VYgRpPKwiAFF+VR91NLZh
	O24cGsRdNhFmaAiPmD2cApZrNzzvsZ/Vg/LFhuhLAhRZkibK9eW+pqDjXFd77nMzvPxO3Ho+OWr9m
	ppMO8JzgD0qhopOB/5V4VxgrR5TnTbG8aBcNtCUYbN1ZxWYyH4kwO65CNuT9662pmEoArvhd3jjJ4
	SIjN4/mNgQXh3Go4MeLBj04f6vapx2vwB8L/qHbkEK5uXFuMXvTexEn2vxPA7GzVlWhVzhpwkMjXS
	InEuarnX4Byr56niLgEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65Gz-00000003Oay-0kJa;
	Mon, 14 Sep 2026 11:54:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65Gs-00000003OYr-0hDx
	for linux-i3c@lists.infradead.org;
	Mon, 14 Sep 2026 11:54:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E6B6343B8C;
	Mon, 14 Sep 2026 11:54:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A8971F000FF;
	Mon, 14 Sep 2026 11:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789386889;
	bh=GcDGTQghALXt3CtzhiFlumKrEJu6/VyE1niMq2F3Qbc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PjgGpt++UaAT+gFbDUl9E5JLgJ/O+x1lNz6/IRQAgkHqtTCBA/DViB3LGzpTs4Ho+
	 TUw+wxgn1OYsGrDknm1den7xrE3QVjtg5d9E7rSi2njdgL5wq4ccKlJ+BxFCeyvddE
	 34u1lLKxw5wq4fPjU8AlxJwxCeayJ+yrBmWwOTIPZovIY//qfDjtJCe6HoxDPUEHAN
	 IWLSeXDcBZ6qoFPxccbcbNEIFu0s6dCRkMYobDgnTYUPewLLFCoSJZyjZyWU+p/2M3
	 jvJXnrpampnsMzWilPz70GaRJLRPPHQogfN7292bcc+fOVRgOyKM/4ON36LKgtvpoh
	 Cf9OoQ3t5IYVA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 17/17] i3c: mipi-i3c-hci: Add HDR-DDR support
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org, linux-i3c@lists.infradead.org
In-Reply-To: <20260914113003.183150-18-adrian.hunter@intel.com>
References: <20260914113003.183150-1-adrian.hunter@intel.com>
 <20260914113003.183150-18-adrian.hunter@intel.com>
Date: Mon, 14 Sep 2026 11:54:49 +0000
Message-Id: <20260914115449.8A8971F000FF@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIFRoZSBIRFIgQ29tbWFu
ZCBDb2RlJ3MgUk5XIGJpdCAoYml0IDcpIGlzIGluY29ycmVjdGx5IG1hc2tlZCBvdXQgd2hlbiBj
b25zdHJ1Y3RpbmcgdGhlIHRyYW5zZmVyIGRlc2NyaXB0b3IsIGNhdXNpbmcgSERSIHJlYWQgY29t
bWFuZHMgdG8gYmUgc2VudCBhcyB3cml0ZSBjb21tYW5kcyBvbiB0aGUgYnVzLgotLQoKY29tbWl0
IGYxZjYxZGVhNWRmMGUzMDAwYjFiNTE5YWE3OGEzODg2ZmJiNjE5NDIKQXV0aG9yOiBBZHJpYW4g
SHVudGVyIDxhZHJpYW4uaHVudGVyQGludGVsLmNvbT4KU3ViamVjdDogaTNjOiBtaXBpLWkzYy1o
Y2k6IEFkZCBIRFItRERSIHN1cHBvcnQKClRoaXMgcGF0Y2ggYWRkcyBzdXBwb3J0IGZvciBIRFIt
RERSIHByaXZhdGUgdHJhbnNmZXJzIGluIHRoZSBNSVBJIEkzQyBIQ0kKZHJpdmVyLiBJdCBlbmNv
ZGVzIEhEUi1ERFIgQ29tbWFuZCBEZXNjcmlwdG9ycywgYWR2ZXJ0aXNlcyBIRFItRERSIGNhcGFi
aWxpdHkKd2hlbiBzdXBwb3J0ZWQgYnkgdGhlIGNvbnRyb2xsZXIsIGFuZCBlbmZvcmNlcyBIRFIt
RERSIHRyYW5zZmVyIGNvbnN0cmFpbnRzLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFz
dGVyL21pcGktaTNjLWhjaS9jbWRfdjEuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1o
Y2kvY21kX3YxLmMKPiBpbmRleCA5OTEwZGY1M2MwMTNkLi43OGFkMmVjMmJkOTM2IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvY21kX3YxLmMKPiArKysgYi9k
cml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2NtZF92MS5jCj4gQEAgLTIxNSwxNCArMjE1
LDMwIEBAIHN0YXRpYyBpbnQgaGNpX2NtZF92MV9wcmVwX2NjYyhzdHJ1Y3QgaTNjX2hjaSAqaGNp
LAo+ICAKPiAgc3RhdGljIHZvaWQgaGNpX2NtZF92MV9wcmVwX2kzY194ZmVyKHN0cnVjdCBpM2Nf
aGNpICpoY2ksCj4gIAkJCQkgICAgIHN0cnVjdCBpM2NfZGV2X2Rlc2MgKmRldiwKPiAtCQkJCSAg
ICAgc3RydWN0IGhjaV94ZmVyICp4ZmVyKQo+ICsJCQkJICAgICBzdHJ1Y3QgaGNpX3hmZXIgKnhm
ZXIsCj4gKwkJCQkgICAgIGVudW0gaTNjX3hmZXJfbW9kZSB4ZmVyX21vZGUpCj4gIHsKPiAgCXN0
cnVjdCBpM2NfaGNpX2Rldl9kYXRhICpkZXZfZGF0YSA9IGkzY19kZXZfZ2V0X21hc3Rlcl9kYXRh
KGRldik7Cj4gIAl1bnNpZ25lZCBpbnQgZGF0X2lkeCA9IGRldl9kYXRhLT5kYXRfaWR4Owo+IC0J
ZW51bSBoY2lfY21kX21vZGUgbW9kZSA9IGdldF9pM2NfbW9kZShoY2kpOwo+ICsJZW51bSBoY2lf
Y21kX21vZGUgbW9kZTsKPiAgCXU4ICpkYXRhID0geGZlci0+ZGF0YTsKPiAgCXVuc2lnbmVkIGlu
dCBkYXRhX2xlbiA9IHhmZXItPmRhdGFfbGVuOwo+ICAJYm9vbCBybncgPSB4ZmVyLT5ybnc7Cj4g
Kwl1MzIgY3BfY21kID0gMDsKPiArCj4gKwlpZiAoeGZlcl9tb2RlID09IEkzQ19TRFIpIHsKPiAr
CQltb2RlID0gZ2V0X2kzY19tb2RlKGhjaSk7Cj4gKwl9IGVsc2Ugewo+ICsJCS8qCj4gKwkJICog
SERSLUREUiBpcyB0aGUgb25seSBhZHZlcnRpc2VkIEhEUiBNb2RlLCBzbyBhIG5vbi1TRFIKPiAr
CQkgKiB0cmFuc2ZlciB1c2VzIHRoZSBIRFItRERSIENvbW1hbmQgQ29kZSBlbmNvZGluZzogQ1Ag
bWFya3MgQ01ECj4gKwkJICogYXMgdmFsaWQsIENNRCBjYXJyaWVzIGJpdHNbNjowXSwgYW5kIFJO
VyBjYXJyaWVzIGJpdFs3XS4gQ1AKPiArCQkgKiBhbmQgQ01EIG9jY3VweSB0aGUgc2FtZSBkZXNj
cmlwdG9yIGJpdHMgaW4gYm90aCBjb21tYW5kCj4gKwkJICogZm9ybWF0cy4KPiArCQkgKi8KPiAr
CQltb2RlID0gTU9ERV9JM0NfSERSX0REUjsKPiArCQljcF9jbWQgPSBDTURfUjBfQ1AgfCBDTURf
UjBfQ01EKHhmZXItPmhkcl9jbWQgJiBJM0NfSERSX0NNRF9DT0RFKTsKICAgICAgICAgICAgICAg
IF5eXl5eXl5eCgpbU2V2ZXJpdHk6IEhpZ2hdCkRvZXMgbWFza2luZyB4ZmVyLT5oZHJfY21kIHdp
dGggSTNDX0hEUl9DTURfQ09ERSB1bmludGVudGlvbmFsbHkgc3RyaXAgdGhlIFJOVwpiaXQgKGJp
dCA3KSBmcm9tIHRoZSA4LWJpdCBIRFIgQ29tbWFuZCBDb2RlIGJlZm9yZSBpdCBpcyBwbGFjZWQg
aW50byB0aGUKZGVzY3JpcHRvcj8KClNpbmNlIENNRF9SMF9DTUQgb2NjdXBpZXMgYW4gOC1iaXQg
ZmllbGQgKGJpdHMgMTQ6NykgaW4gdGhlIGRlc2NyaXB0b3IgYW5kCnhmZXItPmhkcl9jbWQgaXMg
bWFza2VkIHdpdGggMHg3RiwgYml0IDE0IG9mIHRoZSBkZXNjcmlwdG9yIHdpbGwgYWx3YXlzIGJl
CmZvcmNlZCB0byAwLgoKSWYgdGhlIGhhcmR3YXJlIHNlbmRzIHRoZSA4LWJpdCBDTUQgZmllbGQg
ZXhhY3RseSBhcyBwcm92aWRlZCBvbnRvIHRoZSBidXMKcmF0aGVyIHRoYW4gYXV0b21hdGljYWxs
eSBtZXJnaW5nIGluIENNRF9SMF9STlcgKGJpdCAyOSksIHdpbGwgdGhpcyBjYXVzZSBIRFIKcmVh
ZCB0cmFuc2ZlcnMgdG8gYmUgdHJhbnNtaXR0ZWQgYXMgd3JpdGUgY29tbWFuZHM/IFRoaXMgY291
bGQgbGVhZCB0byBidXMKcHJvdG9jb2wgZXJyb3JzIG9yIHRpbWVvdXRzLCBhcyB0aGUgdGFyZ2V0
IGRldmljZSB3aWxsIGV4cGVjdCB0byByZWNlaXZlIGRhdGEKaW5zdGVhZCBvZiBwcm92aWRpbmcg
aXQuCgo+ICAJfQo+ICAKPiAgCXhmZXItPmNtZF90aWQgPSBoY2lfZ2V0X3RpZCgpOwoKLS0gClNh
c2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDkx
NDExMzAwMy4xODMxNTAtMS1hZHJpYW4uaHVudGVyQGludGVsLmNvbT9wYXJ0PTE3CgotLSAKbGlu
dXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
