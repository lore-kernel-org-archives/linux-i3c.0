Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE3FC197A0
	for <linux-i3c@archiver.kernel.org>; Fri, 17 Nov 2023 11:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W1PBfK8S/BAUw9JVSNCpXd3xEnEBJTThVcSwfuepxWA=; b=sb1+jFBfuuqwkC
	iLwzp2TZ8KneBXxjjOQEz7edRWByD4Z2Q4JEI2O+AtUVssHg3NreiDPTs4gtH33NGEdiAbTGYXHZu
	QN2+ug4w5KTk0VD6Phblnf3U37yTmxg8NAHhtVCs+fJv1Y7o+QG3VjQL75m5DGe6COl1nbQYjTsBe
	sS7VOsE2aGr2KMqWY/kiaHyWVhSZRV16GdpFIK9nWNWOiqmz36F/73BBeMj9804BBUamqTNzeusX8
	ZpwEQxsgFlzOLYhlzizW2X7Ex5fNZY+OMaYA8NmYQ2cjhpeS563e74TUm9w7EVXMtC6MFW2DkMmah
	RN63GTNesbuN8YNLsNYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3wjA-006HbJ-39;
	Fri, 17 Nov 2023 11:09:36 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3wj8-006HaF-0I
	for linux-i3c@lists.infradead.org;
	Fri, 17 Nov 2023 11:09:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700219375; x=1731755375;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Rur5CuCPTfZR7PJxxfZpzIEcWzGrbl0Yrknq8TS7jFc=;
  b=D7q+GBgvcBQrbwQdw7nuM+v6OF+cuLtXnO8FZEF89DHVhedop6kCA6pk
   u8jYS8hDH4QYCMikexGbbFohSvpt5pMMNU3Jme0E+ao4S3X3RrbYG+49K
   jsIiLLrrl2kK7fU1YnWEX8fAY8k3yiufr0+uflDpcZ1S8uDmDBEw4ntd0
   8ab34zsueTE5LidgQ9LE6Ph0Za8oIskaPhLIsLsKsaR2RxoiEMtRqMIvH
   sQIq0EbndNOaMBQJRNqbC224URoRIw2RWI6u2eRqOkQs6RhOcdhd2e+dq
   jibOCO9daPPCyNk2ZOF/cp/yohlGUbVPMvIWDWImdNcnrcYTga5fBxgyl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="4422899"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="4422899"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 03:09:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="883098908"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="883098908"
Received: from unknown (HELO mylly.fi.intel.com.) ([10.237.72.75])
  by fmsmga002.fm.intel.com with ESMTP; 17 Nov 2023 03:09:28 -0800
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Joshua Yeong <joshua.yeong@starfivetech.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH] i3c: master: Fix build error
Date: Fri, 17 Nov 2023 13:09:24 +0200
Message-ID: <20231117110924.634280-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_030934_186746_679DFD9D 
X-CRM114-Status: GOOD (  11.59  )
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

Rml4IGJ1aWxkIGVycm9yIGNhdXNlZCBieSBjb21taXQgMmFhYzBiZjRlYmM4ICgiaTNjOiBBZGQg
ZmFsbGJhY2sgbWV0aG9kCmZvciBHRVRNWERTIENDQyIpIHdoaWNoIGluY29ycmVjdGx5IGFjY2Vz
cyB0aGUgInN0cnVjdCBpM2NfY2NjX2NtZF9kZXN0CmRlc3QiIGFzIHBvaW50ZXIuCgpkcml2ZXJz
L2kzYy9tYXN0ZXIuYzogSW4gZnVuY3Rpb24g4oCYaTNjX21hc3Rlcl9nZXRteGRzX2xvY2tlZOKA
mToKZHJpdmVycy9pM2MvbWFzdGVyLmM6MTE0MDoyMTogZXJyb3I6IGludmFsaWQgdHlwZSBhcmd1
bWVudCBvZiDigJgtPuKAmSAoaGF2ZSDigJhzdHJ1Y3QgaTNjX2NjY19jbWRfZGVzdOKAmSkKIDEx
NDAgfCAgICAgICAgICAgICAgICAgZGVzdC0+cGF5bG9hZC5sZW4gLT0gMzsKICAgICAgfCAgICAg
ICAgICAgICAgICAgICAgIF5+CgpGaXhlczogMmFhYzBiZjRlYmM4ICgiaTNjOiBBZGQgZmFsbGJh
Y2sgbWV0aG9kIGZvciBHRVRNWERTIENDQyIpClNpZ25lZC1vZmYtYnk6IEphcmtrbyBOaWt1bGEg
PGphcmtrby5uaWt1bGFAbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvaTNjL21hc3Rlci5j
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIuYwpp
bmRleCA3MThiNjQzY2I1NGQuLjhiNzI5ZWJhZTJhNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9pM2Mv
bWFzdGVyLmMKKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyLmMKQEAgLTExMzUsNyArMTEzNSw3IEBA
IHN0YXRpYyBpbnQgaTNjX21hc3Rlcl9nZXRteGRzX2xvY2tlZChzdHJ1Y3QgaTNjX21hc3Rlcl9j
b250cm9sbGVyICptYXN0ZXIsCiAJCSAqIFJldHJ5IHdoZW4gdGhlIGRldmljZSBkb2VzIG5vdCBz
dXBwb3J0IG1heCByZWFkIHR1cm5hcm91bmQKIAkJICogd2hpbGUgZXhwZWN0aW5nIHNob3J0ZXIg
bGVuZ3RoIGZyb20gdGhpcyBDQ0MgY29tbWFuZC4KIAkJICovCi0JCWRlc3QtPnBheWxvYWQubGVu
IC09IDM7CisJCWRlc3QucGF5bG9hZC5sZW4gLT0gMzsKIAkJcmV0ID0gaTNjX21hc3Rlcl9zZW5k
X2NjY19jbWRfbG9ja2VkKG1hc3RlciwgJmNtZCk7CiAJCWlmIChyZXQpCiAJCQlnb3RvIG91dDsK
LS0gCjIuNDIuMAoKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtaTNjCg==
