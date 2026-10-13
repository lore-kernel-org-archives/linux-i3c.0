Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26ABCC6B0E
	for <linux-i3c@archiver.kernel.org>; Tue, 13 Oct 2026 07:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EHFakdFXzwXGE4vHUb+PmTBFCe9uX18t00hIhktZBOM=; b=YseDRS8eyhfPxa
	t6fMZ+cIZ8PZ2ZOmc0IxBW+WHjUpM2/Kiebu58iZFIksYnsALHv9/yi32H9gfB15HNBNo2tLix9L/
	AYw40Mt1rEa9eFgUI9bHaT6WffuSzcukig7+xQMEQgzoiPLpp6DQGkC6R2ZgEg0Hd65e52waAbwus
	m4VdUDylAtoaw7JtoPXKtsuySSd1ozzGsfwJnl+4hl5m1OocgJFbs4q5PF9dwlbh3DhcmMIJLwaAx
	c81C4CJS47duHjc2azuYddB3rjDeVUb9pr6MUWKcXRCQ5Ec584dVFzEWmIKBSfPxfBOa0iW4UDRWY
	O+lz5BHsIU83SiT3Fpcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGX9v-0000000CF0S-1raM;
	Tue, 13 Oct 2026 07:42:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGX9t-0000000CF0A-2lmZ
	for linux-i3c@lists.infradead.org;
	Tue, 13 Oct 2026 07:42:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C83C0600D1;
	Tue, 13 Oct 2026 07:42:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C0321F000FF;
	Tue, 13 Oct 2026 07:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791877368;
	bh=jYup5wLeCRlRSBc1xknFw22JmiPuKeTYBUjDoiALrgg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=al16FpNov/LT6Ny2hDMaBKO7Y05KW/0HMpCOkPD0dpLd3n5tUdb4yByrLDLPGbwvu
	 w1CxSa/YqkF3eVCC8Zw+x9SFtPnYJp5hT+Vx18qFaHN+m0oKBeebg6+QhobMcf/ifG
	 7sexVg9E0VJlsyAPCsiVf2u2dcRYC0H+dPXk3EzSsKy3ZWEnaV40910BAZfKwXk0Yr
	 2lbcNIodDyzOA/1+35zHFdBv+lZGABgo1C8j1QzT04ztACuNu9eZlh+qpGmlo5M30Z
	 oRQ0fck/kA7nmgGzDwifpaPAO0vbxeNdpwjCRZ3uh56cHnp3nAWA6Ifv9j0ajHXriZ
	 5pSAqip1Sd22Q==
Message-ID: <sashiko-outbox-169200@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] i3c: master: dw-i3c-master: Add HDR-DDR support to
 Designware Controller.
To: "Dineshkumar Parameswaran" <Dineshkumar.Parameswaran@synopsys.com>, linux-i3c@lists.infradead.org
Cc: Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20261013073126.5948-1-parame@synopsys.com>
References: <20261013073126.5948-1-parame@synopsys.com>
Date: Tue, 13 Oct 2026 07:42:47 +0000
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
NCBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIGkzYzogYml0d2lzZSBP
UiB3aXRob3V0IGNsZWFyIGNvcnJ1cHRzIENPTU1BTkRfUE9SVF9TUEVFRCBpbiBIRFItRERSIG1v
ZGUKLSBbSGlnaF0gaTNjOiBFTlRIRFIwIENDQyByZWR1bmRhbnRseSBhcHBsaWVkIHRvIGFsbCB0
cmFuc2ZlcnMgaW4gYSBiYXRjaAotIFtIaWdoXSBpM2M6IHNwZWVkIGZpZWxkIGNvcnJ1cHRpb24g
YW5kIEVOVEhEUiByZXBldGl0aW9uIGluIEhEUiBtb2RlCi0gW01lZGl1bV0gaTNjOiBtaXNzaW5n
IEhEUi1ERFIgY2FwYWJpbGl0eSBhZHZlcnRpc2VtZW50IGluIGR3X2kzY19tYXN0ZXJfYnVzX2lu
aXQoKQotLQoKY29tbWl0IDllZWFhYmIyOTZmZTEzMzUzYmNkMGNiNzg4MzA3NjU2N2UyNjU3NjAK
QXV0aG9yOiBEaW5lc2hrdW1hciBQYXJhbWVzd2FyYW4gPERpbmVzaGt1bWFyLlBhcmFtZXN3YXJh
bkBzeW5vcHN5cy5jb20+CgppM2M6IG1hc3RlcjogZHctaTNjLW1hc3RlcjogQWRkIEhEUi1ERFIg
c3VwcG9ydCB0byBEZXNpZ253YXJlIENvbnRyb2xsZXIuCiAgICAKSW1wbGVtZW50IEhEUi1ERFIg
dHJhbnNmZXIgc3VwcG9ydCBmb3IgdGhlIERlc2lnbldhcmUgQ29udHJvbGxlci4KT25seSBzdXBw
b3J0IGZvciBwcml2YXRlIHRyYW5zZmVycyBhbmQgZG9lcyBub3Qgc3VwcG9ydCBzZW5kaW5nIEND
Qwpjb21tYW5kcyBpbiBIRFIgbW9kZS4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rl
ci9kdy1pM2MtbWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jCj4g
aW5kZXggZDExMTlmMjAzZDFiNi4uZDEwMTMyMDRhYjdiNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jCj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL2R3
LWkzYy1tYXN0ZXIuYwpbIC4uLiBdCj4gQEAgLTEwMTcsNiArMTAxOSwxMSBAQCBzdGF0aWMgaW50
IGR3X2kzY19tYXN0ZXJfaTNjX3hmZXJzKHN0cnVjdCBpM2NfZGV2X2Rlc2MgKmRldiwKPiAgCQkJ
ICAgICAgIENPTU1BTkRfUE9SVF9ERVZfSU5ERVgoZGF0YS0+aW5kZXgpIHwKPiAgCQkJICAgICAg
IENPTU1BTkRfUE9SVF9ST0M7Cj4gIAo+ICsJCWlmIChtb2RlID09IEkzQ19IRFJfRERSKQo+ICsJ
CQljbWQtPmNtZF9sbyB8PSBDT01NQU5EX1BPUlRfQ1AgfAo+ICsJCQkJQ09NTUFORF9QT1JUX0NN
RChJM0NfQ0NDX0VOVEhEUigwKSkgfAo+ICsJCQkJQ09NTUFORF9QT1JUX1NQRUVEKERXX0kzQ19I
RFJfRERSX1NQRUVEKTsKCltTZXZlcml0eTogSGlnaF0KU2luY2UgY21kLT5jbWRfbG8gd2FzIGlu
aXRpYWxpemVkIGVhcmxpZXIgaW4gdGhpcyBsb29wIHdpdGgKQ09NTUFORF9QT1JUX1NQRUVEKGRl
di0+aW5mby5tYXhfcmVhZF9kcykgb3IgbWF4X3dyaXRlX2RzLCB3b24ndCB0aGlzIGJpdHdpc2UK
T1Igb3BlcmF0aW9uIG1lcmdlIHRoZSB0d28gc3BlZWQgdmFsdWVzIHRvZ2V0aGVyIHdpdGhvdXQg
Y2xlYXJpbmcgdGhlIHByZXZpb3VzCmJpdHM/IFRoaXMgY291bGQgcmVzdWx0IGluIGNvcnJ1cHRl
ZCBzcGVlZCBjb25maWd1cmF0aW9uIGJpdHMgYmVpbmcgc2VudCB0byB0aGUKaGFyZHdhcmUgY29u
dHJvbGxlci4KCltTZXZlcml0eTogSGlnaF0KVGhpcyBibG9jayBpcyBpbnNpZGUgdGhlIGZvciBs
b29wIGl0ZXJhdGluZyBvdmVyIGkzY19ueGZlcnMuIFdpbGwgdGhpcwpjYXVzZSB0aGUgQ09NTUFO
RF9QT1JUX0NQIGFuZCBJM0NfQ0NDX0VOVEhEUigwKSBjb21tYW5kIGJpdHMgdG8gYmUgcmVwZWF0
ZWRseQphcHBsaWVkIHRvIGV2ZXJ5IHNlZ21lbnQgb2YgYSBtdWx0aS1tZXNzYWdlIHRyYW5zZmVy
LCBpbnN0ZWFkIG9mIGp1c3QgdGhlIGZpcnN0CnRyYW5zZmVyPyBTZW5kaW5nIHRoZSBFTlRIRFIw
IGNvbW1hbmQgcmVwZWF0ZWRseSB3aGlsZSBhbHJlYWR5IGluIEhEUiBtb2RlIG1heQpjYXVzZSBw
cm90b2NvbCB2aW9sYXRpb25zIG9uIHRoZSBidXMuCgpbU2V2ZXJpdHk6IE1lZGl1bV0KU2luY2Ug
dGhpcyBwYXRjaCBhZGRzIEhEUi1ERFIgdHJhbnNmZXIgc3VwcG9ydCwgc2hvdWxkIHRoZSBtYXN0
ZXIgY29udHJvbGxlcgphbHNvIGFkdmVydGlzZSB0aGlzIG5ldyBjYXBhYmlsaXR5IGR1cmluZyBi
dXMgaW5pdGlhbGl6YXRpb24/CgpJbiBkd19pM2NfbWFzdGVyX2J1c19pbml0KCksIGluZm8uaGRy
X2NhcCBpcyBub3QgdXBkYXRlZCB0byBpbmNsdWRlCnRoZSBJM0NfSERSX0REUiBjYXBhYmlsaXR5
OgoKCW1lbXNldCgmaW5mbywgMCwgc2l6ZW9mKGluZm8pKTsKCWluZm8uZHluX2FkZHIgPSByZXQ7
CgoJcmV0ID0gaTNjX21hc3Rlcl9zZXRfaW5mbygmbWFzdGVyLT5iYXNlLCAmaW5mbyk7CgpXaXRo
b3V0IHNldHRpbmcgaW5mby5oZHJfY2FwIHRvIGluY2x1ZGUgSTNDX0NDQ19IRFJfTU9ERShJM0Nf
SERSX0REUiksIHdvbid0CnRoZSBJM0MgY29yZSByZWplY3QgSERSLUREUiB0cmFuc2ZlcnMgd2l0
aCAtRU9QTk9UU1VQUCBpbgppM2NfZGV2X2RvX3hmZXJzX2xvY2tlZCgpIGJlZm9yZSB0aGV5IGNh
biBldmVyIHJlYWNoIHRoZSBuZXdseSBhZGRlZCBjb2RlIGluCmR3X2kzY19tYXN0ZXJfaTNjX3hm
ZXJzKCk/Cgo+ICsKPiAgCQlpZiAoaSA9PSAoaTNjX254ZmVycyAtIDEpKQo+ICAJCQljbWQtPmNt
ZF9sbyB8PSBDT01NQU5EX1BPUlRfVE9DOwo+ICAJfQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3
IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTAxMzA3MzEyNi41OTQ4LTEtcGFy
YW1lQHN5bm9wc3lzLmNvbT9wYXJ0PTEKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4
LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtaTNjCg==
