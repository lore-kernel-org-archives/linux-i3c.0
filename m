Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30531CD98C8
	for <linux-i3c@archiver.kernel.org>; Wed, 10 Jun 2026 07:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dTznAUUxpo+JuNrzmWKDzLjFSKih4tSuL4jHzADQOKw=; b=ZRIK1c8JJIKRjL
	EVHBqqaI/qRhsDY/EdDLJ3VK04zRXPDWUCjLcmSy7MerzFv3H+K65DbjdAn37ugaVwOBivqTqVDwZ
	NdmbhnVxYE/jZl2UuXo5mOS0DTmIFlPueRU+1PR11g+B0VXpvxsr2eIB489VAukLXWGzfsqR4Yft/
	AFvykMLx6FRiasnMcfUUxcV6SZyso6FEfssm6rhS7ZN6OwIC7z/5k9IDszkiO6v8iRb/P/wrVsDIV
	wPGf3IhW8bPlt7xkdQObAKT0ie81e3PS10s37nj59+FnmfjHgVOC3c2Rw8HChhILG7E0QaJJp8OFK
	5EVdkUY16Bz9BjjUwALw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXDOJ-00000006xTR-3rR3;
	Wed, 10 Jun 2026 07:30:23 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXDOG-00000006xQn-3lvD
	for linux-i3c@lists.infradead.org;
	Wed, 10 Jun 2026 07:30:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781076621; x=1812612621;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Iil2ocVoAMeQzOA2FXTuLwD1NAdo6EBe1TOz5vHqZ68=;
  b=dd+LA3wBo8SroeiirsK8DQgzKx8gqDnlyW/XyKjWu09DI+Arol5XtuKR
   eHeP5K6R4+CD0NiX01ooQAt3W3wJhckoNbdBupquKLJz7hsZ20nFLVRB4
   BgPOaSGXwjQIUQrgeXpXW7yngJ+qEXRuWeLEsm2T2eirSMikU1KBmVO22
   lz9QqozdM6Nx+XaFZOv4jJI/grLElloAiwRMsFBEAwVdWRPwnmV9ES/sv
   yLbGdbaoBvgGP1kgDifJiwDMuTEROH0Na+JjQLljhQXQ9J8mUcV8IKPpT
   9ZOgT4SUpgv73SQp3NYAQ1VxPLF42wK687aOUItZ2PYXh3PgS7/Da6chF
   w==;
X-CSE-ConnectionGUID: AUchZRL6SXajg7k+wtY+lQ==
X-CSE-MsgGUID: BPcrSCFfSI+c7YPam19NVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="80878413"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="80878413"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 00:29:11 -0700
X-CSE-ConnectionGUID: j11I+wTGQe+lehkty0MWvQ==
X-CSE-MsgGUID: cNkLaBDFS/m97YU5ZVSUpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="270103443"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.210])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 00:29:09 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 2/7] i3c: mipi-i3c-hci: Ignore DISEC failures when disabling IBIs
Date: Wed, 10 Jun 2026 10:28:47 +0300
Message-ID: <20260610072852.36934-3-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260610072852.36934-1-adrian.hunter@intel.com>
References: <20260610072852.36934-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_003020_968895_02CBD0C2 
X-CRM114-Status: GOOD (  12.67  )
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

RGlzYWJsaW5nIElCSXMgY3VycmVudGx5IHJldHVybnMgdGhlIHJlc3VsdCBvZiB0aGUgRElTRUMg
Q0NDLCBjYXVzaW5nCmkzY19oY2lfZGlzYWJsZV9pYmkoKSB0byBmYWlsIGlmIHRoZSB0cmFuc2Zl
ciBlcnJvcnMgb3V0LgoKSG93ZXZlciwgdGhlIGNvbnRyb2xsZXIgaGFzIGFscmVhZHkgYmVlbiBw
cm9ncmFtbWVkIHRvIHJlamVjdCBJQklzIGJ5CnNldHRpbmcgREFUXzBfU0lSX1JFSkVDVCwgc28g
dGhlIHRhcmdldOKAmXMgSUJJcyBhcmUgZWZmZWN0aXZlbHkgZGlzYWJsZWQKZnJvbSB0aGUgaG9z
dCBzaWRlIHJlZ2FyZGxlc3Mgb2YgdGhlIG91dGNvbWUgb2YgdGhlIERJU0VDIGNvbW1hbmQuICBB
dAp0aGlzIHBvaW50LCB0ZWFyZG93biBvZiB0aGUgSUJJIGluZnJhc3RydWN0dXJlIGNhbiBzYWZl
bHkgcHJvY2VlZCBldmVuCmlmIERJU0VDIGZhaWxzLgoKTm90ZSwgZnJvbSB0aGVuIG9uLCB0aGUg
TUlQSSBJM0MgSENJIG5vdCBvbmx5IE5BQ0tzIHRoZSB0YXJnZXQncyBJQkkgYnV0CmF1dG9tYXRp
Y2FsbHkgc2VuZHMgYW5vdGhlciBESVNFQyBjb21tYW5kLgoKTWFrZSBpM2NfaGNpX2Rpc2FibGVf
aWJpKCkgcmVzaWxpZW50IGJ5IGlnbm9yaW5nIHRoZSByZXR1cm4gdmFsdWUgb2YKaTNjX21hc3Rl
cl9kaXNlY19sb2NrZWQoKSBhbmQgYWx3YXlzIHJldHVybmluZyBzdWNjZXNzLgoKU2lnbmVkLW9m
Zi1ieTogQWRyaWFuIEh1bnRlciA8YWRyaWFuLmh1bnRlckBpbnRlbC5jb20+ClJldmlld2VkLWJ5
OiBGcmFuayBMaSA8RnJhbmsuTGlAbnhwLmNvbT4KLS0tCgoKQ2hhbmdlcyBpbiBWMzoKCglBZGQg
RnJhbmsncyBSZXYnZC1ieQoKQ2hhbmdlcyBpbiBWMjoKCglSZS1iYXNlIGR1ZSB0byBjaGFuZ2Vz
IGluIHByZXZpb3VzIHBhdGNoLgoKCiBkcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2Nv
cmUuYyB8IDggKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2Nv
cmUuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvY29yZS5jCmluZGV4IDFlMWYw
NWFmZjA5Mi4uZmZmYmMxNzc1ZWY5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIvbWlw
aS1pM2MtaGNpL2NvcmUuYworKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2Nv
cmUuYwpAQCAtNjk3LDcgKzY5NywxMyBAQCBzdGF0aWMgaW50IGkzY19oY2lfZGlzYWJsZV9pYmko
c3RydWN0IGkzY19kZXZfZGVzYyAqZGV2KQogCXN0cnVjdCBpM2NfaGNpICpoY2kgPSB0b19pM2Nf
aGNpKG0pOwogCiAJX19pM2NfaGNpX2Rpc2FibGVfaWJpKGhjaSwgZGV2KTsKLQlyZXR1cm4gaTNj
X21hc3Rlcl9kaXNlY19sb2NrZWQobSwgZGV2LT5pbmZvLmR5bl9hZGRyLCBJM0NfQ0NDX0VWRU5U
X1NJUik7CisJLyoKKwkgKiBUaGUgREFUIGVudHJ5IGlzIG5vdyBzZXQgdG8gTkFDSyBhbmQgRElT
RUMgdGhpcyB0YXJnZXQncyBJQklzLCBzbworCSAqIHRoZSBJQkkgdGVhcmRvd24gY2FuIHByb2Nl
ZWQgZXZlbiBpZiBESVNFQyBiZWxvdyBmYWlscywgc28gaWdub3JlCisJICogZXJyb3JzLgorCSAq
LworCWkzY19tYXN0ZXJfZGlzZWNfbG9ja2VkKG0sIGRldi0+aW5mby5keW5fYWRkciwgSTNDX0ND
Q19FVkVOVF9TSVIpOworCXJldHVybiAwOwogfQogCiBzdGF0aWMgdm9pZCBpM2NfaGNpX3JlY3lj
bGVfaWJpX3Nsb3Qoc3RydWN0IGkzY19kZXZfZGVzYyAqZGV2LAotLSAKMi41MS4wCgoKLS0gCmxp
bnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
