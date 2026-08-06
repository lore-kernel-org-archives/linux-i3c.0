Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982B9C55ABF
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Aug 2026 13:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GQXCP/7k1B5CcINOSchTsD0qv1Fw8Tnny2OmyXXY5lk=; b=qztDghDQna3ecy
	6UOUvNEcBT9xN5IBjnXhVprXP9GJpaBGADKGLUK1qaJ0ody/HReBZe/qVCWHX+vAo7GlW8wUn4qz+
	ZHpAawEsTrc/+5YqwRllv3a9qdLT+fH9MWlWYOGm8S31/HHIn0qz/Xn7v+MMHDn+1OxvP+gfNJMVi
	0FrVuml8ZLgcsVXeP2MulQI0ORBKMI4pMGf7nvjuXq/cwcrE3CkpB3RsvArzCeGSRbNQxlta4YEPW
	pk3mjYVownnEdh88M6/uQWiYTUk2szvlLCXPE59hkq2DjwlBeRdzh9Q7Axr5wZzBwDYshO2zdSmlB
	CFAQAfly+lLCZFTmN+UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wryPY-00000005vop-1Wp4;
	Thu, 06 Aug 2026 13:45:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wryPV-00000005voW-3hkF
	for linux-i3c@lists.infradead.org;
	Thu, 06 Aug 2026 13:45:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0DE1860A7D;
	Thu,  6 Aug 2026 13:45:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DEEC1F000E9;
	Thu,  6 Aug 2026 13:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786023924;
	bh=XpQMAhFQd/di1nMC72MRSNQf97ZENnjMrFdp0Rain/8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VP/j/1WH64ZIpWOtVXJ1k5z03Q0s10kcA1pA/WbwcDapLk1YBAaIMGG52tgj5D8Iw
	 E/NMG0dwIuwsOTKz9HaW7QT0P7ZlIqYQVSliJ/A2K0WF2AbuWSdSvbXOgePArcgGGp
	 N8xZiyCkT1wA/uqF6xrSGBZU5Z0eMmZg2N+fJatGbqE/I3cLKsvKTRr3UXROFZJEEp
	 uhongZwjTscGEgZVmS7F8ZxnqcT4sfGvHoTpknDlXvY1jcxDNm5AQDjf8uDguIlz3r
	 jpbmLXD5UaQNV2BxgBh2oRPfyRC8wNetu5RSB8b0gYO5P4klxeYO5mTxNw9hOwQmxG
	 eud5jyVj9+EeQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V4 07/14] i3c: master: Fix potential UAF in
 i3c_device_match()
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: linux-i3c@lists.infradead.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-pci@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260806131857.119830-8-adrian.hunter@intel.com>
References: <20260806131857.119830-1-adrian.hunter@intel.com>
 <20260806131857.119830-8-adrian.hunter@intel.com>
Date: Thu, 06 Aug 2026 13:45:23 +0000
Message-Id: <20260806134524.6DEEC1F000E9@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIFJlbW92aW5nIHRoZSBO
VUxMIGNoZWNrIGZvciBgaTNjZGV2LT5kZXNjYCBpbnRyb2R1Y2VzIGEgZGV0ZXJtaW5pc3RpYyBO
VUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgZHVyaW5nIGRldmljZSB1bnJlZ2lzdHJhdGlvbiBhbmQg
cmVnaXN0cmF0aW9uIGVycm9yIHBhdGhzLgotIFtIaWdoXSBgaTNjX2RldmljZV9nZXRfaW5mbygp
YCBkZXJlZmVyZW5jZXMgYGRldi0+ZGVzY2Agd2l0aG91dCBjaGVja2luZyBmb3IgTlVMTCB1bmRl
ciB0aGUgbG9jaywgY2F1c2luZyBhIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZS4KLS0KCi0tLSBQ
YXRjaCBbN106IFtQQVRDSCBWNCAwNy8xNF0gaTNjOiBtYXN0ZXI6IEZpeCBwb3RlbnRpYWwgVUFG
IGluIGkzY19kZXZpY2VfbWF0Y2goKSAtLS0KY29tbWl0IDRiNWEzYzgyYTFjNGM1ZjliZjMxZTky
NTk3N2MyMjg2NTIwOTYwZmMKQXV0aG9yOiBBZHJpYW4gSHVudGVyIDxhZHJpYW4uaHVudGVyQGlu
dGVsLmNvbT4KCmkzYzogbWFzdGVyOiBGaXggcG90ZW50aWFsIFVBRiBpbiBpM2NfZGV2aWNlX21h
dGNoKCkKClRoaXMgY29tbWl0IHByb3RlY3RzIGFjY2VzcyB0byBpM2NkZXYtPmRlc2Mgd2l0aCB0
aGUgbm9ybWFsLXVzZSBsb2NrIHRvCnByZXZlbnQgYSB1c2UtYWZ0ZXItZnJlZSB3aGVuIHRoZSBk
ZXNjcmlwdG9yIHBvaW50ZXIgaXMgY29uY3VycmVudGx5CnJlcGxhY2VkLiBTaW5jZSB0aGUgZGVz
Y3JpcHRvciBpcyBhc3N1bWVkIHRvIHJlbWFpbiB2YWxpZCB3aGlsZSB0aGUgbG9jayBpcwpoZWxk
LCB0aGUgTlVMTCBjaGVjayBpcyByZW1vdmVkLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2Mv
bWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIuYwo+IGluZGV4IGVlNzcxYWMwYjIwM2UuLjgz
ZTA0YTJjMjAyYTkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyLmMKPiArKysgYi9k
cml2ZXJzL2kzYy9tYXN0ZXIuYwo+IEBAIC0zNDcsOCArMzQ3LDEwIEBAIHN0YXRpYyBpbnQgaTNj
X2RldmljZV9tYXRjaChzdHJ1Y3QgZGV2aWNlICpkZXYsIGNvbnN0IHN0cnVjdCBkZXZpY2VfZHJp
dmVyICpkcnYpCj4gIAlpM2NkZXYgPSBkZXZfdG9faTNjZGV2KGRldik7Cj4gIAlpM2NkcnYgPSBk
cnZfdG9faTNjZHJ2KGRydik7Cj4gIAo+IC0JaWYgKGkzY2Rldi0+ZGVzYyAmJiBpM2NkZXYtPmRl
c2MtPmJvYXJkaW5mbykKPiArCWkzY19idXNfbm9ybWFsdXNlX2xvY2soaTNjZGV2LT5idXMpOwo+
ICsJaWYgKGkzY2Rldi0+ZGVzYy0+Ym9hcmRpbmZvKQoKW1NldmVyaXR5OiBIaWdoXQpJcyBpdCBz
YWZlIHRvIHJlbW92ZSB0aGUgTlVMTCBjaGVjayBmb3IgaTNjZGV2LT5kZXNjIGhlcmU/CgpJZiBh
IHVzZXJzcGFjZSBwcm9jZXNzIHdyaXRlcyB0byBhIGRyaXZlcidzIGJpbmQgZmlsZSB2aWEgc3lz
ZnMgY29uY3VycmVudGx5CndpdGggYSBkZXZpY2UgcmVnaXN0cmF0aW9uIGZhaWx1cmUsIGJpbmRf
c3RvcmUoKSB3aWxsIGNhbGwKZHJpdmVyX21hdGNoX2RldmljZSgpIGFuZCBldmVudHVhbGx5IHJl
YWNoIGkzY19kZXZpY2VfbWF0Y2goKS4KCkluIHRoZSBlcnJvciBwYXRoIG9mIGkzY19tYXN0ZXJf
cmVnaXN0ZXJfbmV3X2kzY19kZXZzKCksIGkzY2Rldi0+ZGVzYyBpcyBzZXQKdG8gTlVMTCB1bmRl
ciB0aGUgd3JpdGUgbG9jay4gV2hlbiB0aGlzIGNvZGUgc3Vic2VxdWVudGx5IGFjcXVpcmVzIHRo
ZSByZWFkCmxvY2ssIGkzY2Rldi0+ZGVzYyB3aWxsIGJlIE5VTEwsIHdoaWNoIGNvdWxkIGNhdXNl
IGEgTlVMTCBwb2ludGVyCmRlcmVmZXJlbmNlLgoKU2ltaWxhcmx5LCBpM2NfbWFzdGVyX3VucmVn
aXN0ZXJfaTNjX2RldnMoKSBsb2NrbGVzc2x5IHNldHMgaTNjZGV2LT5kZXNjIHRvCk5VTEwgZHVy
aW5nIHRlYXJkb3duLCB3aGljaCBjYW4gYWxzbyByYWNlIHdpdGggdGhpcyBwYXRoLgoKPiAgCQlz
dGF0aWNfYWRkcl9tZXRob2QgPSBpM2NkZXYtPmRlc2MtPmJvYXJkaW5mby0+c3RhdGljX2FkZHJf
bWV0aG9kOwo+ICsJaTNjX2J1c19ub3JtYWx1c2VfdW5sb2NrKGkzY2Rldi0+YnVzKTsKPiAgCj4g
IAkvKgo+ICAJICogU0VUQUFTQS1iYXNlZCBkZXZpY2VzIG5lZWQgbm90IGFsd2F5cyBoYXZlIGEg
bWF0Y2hpbmcgSUQgc2luY2UKPiAgCSAqIGl0IGlzIG5vdCBtYW5kYXRvcnkgZm9yIHN1Y2ggZGV2
aWNlcyB0byBpbXBsZW1lbnQgZGV2aWNlaW5mbwo+ICAJICogQ0NDIGNvbW1hbmRzLiBBbGxvdyB0
aGVtIHRvIHJlZ2lzdGVyIHRocm91Z2ggRFQgb3IgQUNQSS4KPiAgCSAqLwo+ICAJaWYgKGkzY2Ry
di0+aWRfdGFibGUgJiYgaTNjX2RldmljZV9tYXRjaF9pZChpM2NkZXYsIGkzY2Rydi0+aWRfdGFi
bGUpKQoKW1NldmVyaXR5OiBIaWdoXQpEb2VzIHRoaXMgY2FsbCB0byBpM2NfZGV2aWNlX21hdGNo
X2lkKCkgaGF2ZSBhIHNpbWlsYXIgdnVsbmVyYWJpbGl0eT8KCmkzY19kZXZpY2VfbWF0Y2hfaWQo
KSBldmVudHVhbGx5IGNhbGxzIGkzY19kZXZpY2VfZ2V0X2luZm8oKS4gV2hpbGUKaTNjX2Rldmlj
ZV9nZXRfaW5mbygpIGRvZXMgYWNxdWlyZSB0aGUgbm9ybWFsLXVzZSBsb2NrLCBpdCBkaXJlY3Rs
eSByZWFkcwpkZXYtPmRlc2MtPmluZm8gd2l0aG91dCBjaGVja2luZyBpZiBkZXYtPmRlc2MgaXMg
dmFsaWQuCgpJZiBhIGJpbmQgb3BlcmF0aW9uIHJhY2VzIHdpdGggZGV2aWNlIHVucmVnaXN0cmF0
aW9uIG9yIGEgcmVnaXN0cmF0aW9uIGVycm9yCnBhdGgsIGRldi0+ZGVzYyBjb3VsZCBiZSBzZXQg
dG8gTlVMTCBiZWZvcmUgdGhlIGxvY2sgaXMgYWNxdWlyZWQsIGxlYWRpbmcgdG8KYSBjcmFzaCB3
aGVuIHJlYWRpbmcgZGV2LT5kZXNjLT5pbmZvLgoKPiAgCQlyZXR1cm4gMTsKPiAgCj4gIAlpZiAo
c3RhdGljX2FkZHJfbWV0aG9kICYgSTNDX0FERFJfTUVUSE9EX1NFVEFBU0EpIHsKClsgLi4uIF0K
Ci0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQv
MjAyNjA4MDYxMzE4NTcuMTE5ODMwLTEtYWRyaWFuLmh1bnRlckBpbnRlbC5jb20/cGFydD03Cgot
LSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
