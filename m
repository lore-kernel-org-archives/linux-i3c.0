Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030F0C43458
	for <linux-i3c@archiver.kernel.org>; Thu,  9 Jul 2026 06:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fG4w2GvTvbLqaH8ZxubuvExZIdlpwB4Ktq6nOI4PiJk=; b=LcxWR9EK4jiVtd
	OciGpoxEcO+AjGj5mfJdC6S68qj7zhWGV5Wn5BMgCkgfINBOkUJ50SpC/g2qMEp7VK+o8CCj7jfxx
	LQ/c9wttNWzg/+hv78LoaVbf+zvWk61LaE7JLcK3LzzmB4xqVug/HqS9qQo75WXR4sfV5K4LnHvKV
	e76jpIW5fwxKq+8Y7zLvlsMiQjx1gLYtxVwczjhBHvW7QaV8pWycrr9GKjy2VntEGv4rZFDoN4ehJ
	Ckfdf2SXccAcgRNmCPr6kMKCZLe+/J+DegJ9T8LWliQRA7oAWGm6MnDUC0ISGKMF2YY9EeIoTrkm9
	EY4epwagUb3JDkyBRa3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whibr-00000001DXV-2PYG;
	Thu, 09 Jul 2026 06:51:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whibq-00000001DXL-0ppp
	for linux-i3c@lists.infradead.org;
	Thu, 09 Jul 2026 06:51:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E5D7D40C0D;
	Thu,  9 Jul 2026 06:51:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DB071F000E9;
	Thu,  9 Jul 2026 06:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783579905;
	bh=LNVt8YTxltb1B1r72Z1892Yki1h+g80BO93Q9GACIgU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kUQOWc9pS9w2rE8jcScJVrAIPPyaVxwjfUqFoGOBJ6hwe5OvOdaE5sU+V3W7fdBEj
	 de+cFteoe4frcJldwRlMYzXAkJXZs0YsIxmYyP5+5WCpdBwOjmBG6kKpo3StiyHP9d
	 QOXy1kGLrv4mmF5IpYtGF1Gz3UbMIszxgAJ30B4SPpG2/szE53301jNT8XuY17LAHJ
	 NhOCay0hTyAPGmyuig0PJ/F4u+pPIY+PNjagjUcE4nJYaqcQ9VF85Zk8RPloXPITvz
	 C0sEyCwvHNsvckxVXmPiWNXMcX5J/xE/+7xF5pBcJXskuY18M1ho2L93Hq6GPakGSF
	 sXb/qQeHvCQMg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 1/2] dt-bindings: i3c: Add AMD I3C master controller
 support
To: "Shubham Patil" <shubhamsanjay.patil@amd.com>
Cc: devicetree@vger.kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, robh@kernel.org, Frank.Li@kernel.org, linux-i3c@lists.infradead.org, conor+dt@kernel.org
In-Reply-To: <20260709064233.1451482-2-shubhamsanjay.patil@amd.com>
References: <20260709064233.1451482-1-shubhamsanjay.patil@amd.com>
 <20260709064233.1451482-2-shubhamsanjay.patil@amd.com>
Date: Thu, 09 Jul 2026 06:51:44 +0000
Message-Id: <20260709065145.6DB071F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gVGhlIGBpbnRlcnJ1
cHRzYCBwcm9wZXJ0eSBpcyBtaXNzaW5nIGZyb20gdGhlIGByZXF1aXJlZGAgbGlzdCBpbiB0aGUg
YmluZGluZyBzY2hlbWEuCi0tCgotLS0gUGF0Y2ggWzFdOiBbUEFUQ0ggdjEwIDEvMl0gZHQtYmlu
ZGluZ3M6IGkzYzogQWRkIEFNRCBJM0MgbWFzdGVyIGNvbnRyb2xsZXIgc3VwcG9ydCAtLS0KY29t
bWl0IGRmY2QwZjk2MmRkNjc5MDFmNjc1ODI0NTZhOGZlNTI3MTQ5MTc4OWQKQXV0aG9yOiBNYW5p
a2FudGEgR3VudHVwYWxsaSA8bWFuaWthbnRhLmd1bnR1cGFsbGlAYW1kLmNvbT4KCmR0LWJpbmRp
bmdzOiBpM2M6IEFkZCBBTUQgSTNDIG1hc3RlciBjb250cm9sbGVyIHN1cHBvcnQKClRoaXMgY29t
bWl0IGFkZHMgZGV2aWNlIHRyZWUgYmluZGluZyBkb2N1bWVudGF0aW9uIGZvciB0aGUgQU1EIEkz
QyBtYXN0ZXIKY29udHJvbGxlciB2ZXJzaW9uIDEuMC4KCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pM2MveGxueCxheGktaTNjLTEuMC55YW1sIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kzYy94bG54LGF4aS1pM2MtMS4wLnlhbWwK
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMDAuLjJjYWEyNDVhODY1
NjgKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2kzYy94bG54LGF4aS1pM2MtMS4wLnlhbWwKClsgLi4uIF0KCj4gK3Byb3BlcnRpZXM6Cj4g
KyAgY29tcGF0aWJsZToKPiArICAgIGNvbnN0OiB4bG54LGF4aS1pM2MtMS4wCj4gKwo+ICsgIHJl
ZzoKPiArICAgIG1heEl0ZW1zOiAxCj4gKwo+ICsgIGNsb2NrczoKPiArICAgIG1heEl0ZW1zOiAx
Cj4gKwo+ICsgIGludGVycnVwdHM6Cj4gKyAgICBtYXhJdGVtczogMQo+ICsKPiArcmVxdWlyZWQ6
Cj4gKyAgLSBjb21wYXRpYmxlCj4gKyAgLSByZWcKPiArICAtIGNsb2NrcwoKW1NldmVyaXR5OiBN
ZWRpdW1dClNob3VsZCB0aGUgaW50ZXJydXB0cyBwcm9wZXJ0eSBiZSBpbmNsdWRlZCBpbiB0aGlz
IHJlcXVpcmVkIGxpc3Q/CgpTaW5jZSBJM0MgbWFzdGVyIGNvbnRyb2xsZXJzIGZ1bmRhbWVudGFs
bHkgcmVseSBvbiBpbnRlcnJ1cHRzIGZvciBoYW5kbGluZwphc3luY2hyb25vdXMgYnVzIGV2ZW50
cyBsaWtlIEluLUJhbmQgSW50ZXJydXB0cyAoSUJJcykgYW5kIER5bmFtaWMgQWRkcmVzcwpBc3Np
Z25tZW50IChEQUEpLCBhIG1pc3NpbmcgcmVxdWlyZW1lbnQgYWxsb3dzIGluY29tcGxldGUgZGV2
aWNlIHRyZWUgbm9kZXMKdG8gcGFzcyBZQU1MIHNjaGVtYSB2YWxpZGF0aW9uLiBXaWxsIHRoaXMg
bGVhZCB0byBkcml2ZXIgcHJvYmUgb3IgcnVudGltZQpmYWlsdXJlcyB3aGVuIHRoZSBzb2Z0d2Fy
ZSBhdHRlbXB0cyB0byBhY3F1aXJlIHRoZSBtaXNzaW5nIElSUT8KCj4gKwo+ICthbGxPZjoKPiAr
ICAtICRyZWY6IGkzYy55YW1sIwoKWyAuLi4gXQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0
dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDcwOTA2NDIzMy4xNDUxNDgyLTEtc2h1
YmhhbXNhbmpheS5wYXRpbEBhbWQuY29tP3BhcnQ9MQoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxp
c3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
