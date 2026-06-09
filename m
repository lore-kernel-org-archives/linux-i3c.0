Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 712A7CD8CAA
	for <linux-i3c@archiver.kernel.org>; Tue,  9 Jun 2026 10:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mk1uB8AtnP5hnrdaig2MeoS0FIUrgX/b+LRpFfos7q0=; b=xup5znz4tEoYDp
	zVGbXnbCMBCJpJLWwOdtTQKv1T/t8tjfk7cgyQA758XF9UAWC3fCaAvydUgwXXvJ5XrFIq3a03iRL
	COcYpzV1S90DBPbPlXs+14gcg1Wuj+HxneTm5ArTUs3aPf+nc4mQuyUtZ8W2lsRnudxY0+mhIvIfK
	V52FlWfD5EzSWVjdbqhsHQy8n2nhZ82n4fUSwWPAwxpGARkAggd6iit/N1vzFrhIZ7kLZdToJawjf
	0Z6xc+GX9tOMiFOYosVe0F5Z/57qdlu4m0X7Edp/UMI64RulK+CF/2T4umeVnUF+fkYunbM4J1S9J
	Ml17fSTJRrz8zPOLqNWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtj6-00000005MMb-47Td;
	Tue, 09 Jun 2026 10:30:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtj4-00000005MMP-3gVk
	for linux-i3c@lists.infradead.org;
	Tue, 09 Jun 2026 10:30:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F2B45435DE;
	Tue,  9 Jun 2026 10:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 994891F00893;
	Tue,  9 Jun 2026 10:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781001029;
	bh=a00CoOxS5ERbCJAmfyoH9yBYTnHSMkfcBs/RwAURFy8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oC2UNicpD8LZEgMaTWszDQomYyzgfu3YQb2H0V+/cNjG8DKqyC0M1qeuhCN0PACgG
	 aq553E7tnFqTzlJ15C3ebus9GJKQwhm9V7BYV99sFjQSfC2f3LzS0QI3hkfsyGPQTa
	 PYT/AMBfBHEdnPgV80ZjRd3BHJ+1BTOVEfMSTUPRp3gMlQPicDOwJB6JgzORDbxVp1
	 Ry4l85vHIXcm1jitKYtXaX6Xs/0lV2Sz6SkBID3dLGnLyEzl4MFwYgIK1n3z0v0rbc
	 7wErw54RKZgyAdjS8WNqWRCf7MF6z/c8MurDoFCKunoUBh7LizpJKnbJ3P00/TYvHW
	 dieaNQNAGiLCg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] i3c: master: Validate GET CCC payload length and
 retry M0/M2 once
To: tze.yee.ng@altera.com
Cc: Frank.Li@kernel.org, linux-i3c@lists.infradead.org
In-Reply-To: <352ed29363b12d1d145ffd44316564bd8e33444c.1780999511.git.tze.yee.ng@altera.com>
References: <352ed29363b12d1d145ffd44316564bd8e33444c.1780999511.git.tze.yee.ng@altera.com>
Date: Tue, 09 Jun 2026 10:30:29 +0000
Message-Id: <20260609103029.994891F00893@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIEFkZHJlc3MgTkFDS3Mg
YXJlIGluY29ycmVjdGx5IG1hcHBlZCB0byAtRUlOVkFMIGluc3RlYWQgb2YgYSBoYXJkd2FyZSBl
cnJvciBjb2RlICgtRUlPIG9yIC1FTlhJTyksIGJyZWFraW5nIHN0YW5kYXJkIHN1YnN5c3RlbSBl
cnJvciByZXBvcnRpbmcgY29udmVudGlvbnMgZm9yIHN0YW5kYXJkIHRyYW5zZmVycy4KLS0KCmNv
bW1pdCBmMGYxMzU0ODM5YmUzNmY1NWFjNTFlYzlkOGQ5YzE4MjY1M2E2NDk3CkF1dGhvcjogQWRy
aWFuIE5nIEhvIFlpbiA8YWRyaWFuLmhvLnlpbi5uZ0BhbHRlcmEuY29tPgoKaTNjOiBtYXN0ZXI6
IFZhbGlkYXRlIEdFVCBDQ0MgcGF5bG9hZCBsZW5ndGggYW5kIHJldHJ5IE0wL00yIG9uY2UKClZh
bGlkYXRlIEdFVCBDQ0MgcGF5bG9hZCBsZW5ndGggYWZ0ZXIgYSBzdWNjZXNzZnVsIHRyYW5zZmVy
LiBUcmVhdCBhCnNob3J0IHJlYWQgYXMgSTNDX0VSUk9SX00wIGFuZCByZXR1cm4gLUVJTy4gUmV0
cnkgR0VUIENDQ3Mgb25jZSBvbgpyZXRyaWFibGUgZXJyb3JzLgoKWyAuLi4gXQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jIGIvZHJpdmVycy9pM2MvbWFz
dGVyL2R3LWkzYy1tYXN0ZXIuYwo+IGluZGV4IGM0MDA0Zjg3YzY4NTcuLmE4YjVlYmFiZDM1MDgg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyL2R3LWkzYy1tYXN0ZXIuYwo+ICsrKyBi
L2RyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmMKPiBAQCAtNDkzLDcgKzQ5Myw2IEBA
IHN0YXRpYyB2b2lkIGR3X2kzY19tYXN0ZXJfZW5kX3hmZXJfbG9ja2VkKHN0cnVjdCBkd19pM2Nf
bWFzdGVyICptYXN0ZXIsIHUzMiBpc3IpCj4gIAkJCWJyZWFrOwo+ICAJCWNhc2UgUkVTUE9OU0Vf
RVJST1JfUEFSSVRZOgo+ICAJCWNhc2UgUkVTUE9OU0VfRVJST1JfSUJBX05BQ0s6Cj4gLQkJY2Fz
ZSBSRVNQT05TRV9FUlJPUl9BRERSRVNTX05BQ0s6Cj4gIAkJY2FzZSBSRVNQT05TRV9FUlJPUl9U
UkFOU0ZfQUJPUlQ6Cj4gIAkJY2FzZSBSRVNQT05TRV9FUlJPUl9DUkM6Cj4gIAkJY2FzZSBSRVNQ
T05TRV9FUlJPUl9GUkFNRToKPiBAQCAtNTAzLDYgKzUwMiw3IEBAIHN0YXRpYyB2b2lkIGR3X2kz
Y19tYXN0ZXJfZW5kX3hmZXJfbG9ja2VkKHN0cnVjdCBkd19pM2NfbWFzdGVyICptYXN0ZXIsIHUz
MiBpc3IpCj4gIAkJCXJldCA9IC1FTk9TUEM7Cj4gIAkJCWJyZWFrOwo+ICAJCWNhc2UgUkVTUE9O
U0VfRVJST1JfSTJDX1dfTkFDS19FUlI6Cj4gKwkJY2FzZSBSRVNQT05TRV9FUlJPUl9BRERSRVNT
X05BQ0s6Cj4gIAkJZGVmYXVsdDoKPiAgCQkJcmV0ID0gLUVJTlZBTDsKPiAgCQkJYnJlYWs7Cgpb
U2V2ZXJpdHk6IEhpZ2hdCkRvZXMgbW92aW5nIFJFU1BPTlNFX0VSUk9SX0FERFJFU1NfTkFDSyB0
byB0aGUgZGVmYXVsdCBjYXNlIGluY29ycmVjdGx5IG1hcAphZGRyZXNzIE5BQ0tzIHRvIC1FSU5W
QUwgaW5zdGVhZCBvZiBhIGhhcmR3YXJlIGVycm9yIGNvZGUgbGlrZSAtRUlPIG9yCi1FTlhJTz8K
ClRoaXMgZnVuY3Rpb24gc2VydmVzIGFzIHRoZSBnZW5lcmljIGNvbXBsZXRpb24gaGFuZGxlciBm
b3IgYWxsIHRyYW5zZmVycywKaW5jbHVkaW5nIHN0YW5kYXJkIEkzQyBhbmQgSTJDIHByaXZhdGUg
cmVhZHMgYW5kIHdyaXRlcy4gQW4gYWRkcmVzcyBOQUNLCnVzdWFsbHkgaW5kaWNhdGVzIGFuIGFi
c2VudCwgZGlzY29ubmVjdGVkLCBvciBidXN5IGRldmljZS4KClJldHVybmluZyAtRUlOVkFMIGZv
ciBhIGhhcmR3YXJlIE5BQ0sgZHVyaW5nIGEgZGF0YSB0cmFuc2ZlciBkaXZlcmdlcyBmcm9tCnN1
YnN5c3RlbSBjb252ZW50aW9ucy4gQ2FuIHRoaXMgY2F1c2UgdXNlcnNwYWNlIHRvb2xzIGxpa2Ug
aTJjZGV0ZWN0IG9yCmNvcmUgcHJvYmluZyBsb2dpYyB0byBtaXNpbnRlcnByZXQgYW4gYWJzZW50
IGRldmljZSBhcyBhIGZhdGFsIGludmFsaWQKcGFyYW1ldGVyIGVycm9yLCByYXRoZXIgdGhhbiBh
bGxvd2luZyBncmFjZWZ1bCBmYWxsYmFja3M/CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0
cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0L2NvdmVyLjE3ODA5OTk1MTEuZ2l0LnR6ZS55ZWUu
bmdAYWx0ZXJhLmNvbT9wYXJ0PTMKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkz
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtaTNjCg==
