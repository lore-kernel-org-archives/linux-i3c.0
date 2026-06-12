Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC44CD4F2C
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Jun 2026 08:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LJaxGc1gYTGK3F4oHOTCG9+ZSE2cdrKpzgUlqz8JiVE=; b=ZBWZTXR7qcKg/u
	x7pgTa0sBIWcW61idPpBUiLiQqjE1lku/RhaUvitk+IsM6fSzfE7IXdoOs72p5Pj5V075dL2mrZow
	weCc4gqAIPcqv86H8rYeEcmmRaKHOlvXKAOkCdHsaYxKgwVXo+a8cGnl18kz+aR+uJmEravDAziwU
	5mH/4amTHqJdMWNfbNdj5FUt5ltxrMRFmx2gs2KwE1V2A23F2e1aRmwxnHRpGq4GNxLc5+CVnUOiP
	t6peVfbZVeaaNSUbKiPe0FDDAy8SXxadiQiuHsbJAZysKYa8K1hoiVDaRO0Mt7Oz7Oy1xqUnzOa6/
	tzPRkl9o0yhK/mHC5aog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwpc-0000000AXBo-0Wo5;
	Fri, 12 Jun 2026 08:01:36 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwpY-0000000AX8b-1rXk
	for linux-i3c@lists.infradead.org;
	Fri, 12 Jun 2026 08:01:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781251293; x=1812787293;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ClMlOgBM1Bn+TSJGqyqubQ/cA0h85s27faW8u//GBlc=;
  b=D4WD5ew9ZBTAuKBgayuX9tmLaTo5AxFaoUCHo2sJ3p/EqX040IfmnshL
   3t3KoUMT6TNMYQvPmdHbVfZFV49GFIJvKzZV/dbj9ak8mmtZju4Zt2W81
   8yLJ8remU/7UFDPeNB5WnzFPfppcd4JDvvni3/RXJ8uGE/skV26nCWRj6
   QRgWzcS5AOkQ0mG+TpEVyKtmY+YQbR/eLRhjFYguhFdLFAd8ME/e8nMF2
   2bMCoJcuWKQuDQi8j+cd9d18MOD8McJF085/wsz1eCQWdEy1b84F3ld8s
   f5Awc0pbAk3Jx1XRTB5tqmJfOzeaOxDi8ixGIgpok9aiIGYeB6TNKxI7q
   w==;
X-CSE-ConnectionGUID: Vw1Sa4bFSBiIbT4bFWH6LQ==
X-CSE-MsgGUID: 10jRK6X6QDOoisLMMKb+uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82186740"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="82186740"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 01:01:22 -0700
X-CSE-ConnectionGUID: CP2rXTRZT/GYaj6PnkwxBg==
X-CSE-MsgGUID: XjVGrQVrTdat+yPpSWfQ/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="246630340"
Received: from vpanait-mobl.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.41])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 01:01:20 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V4 2/7] i3c: mipi-i3c-hci: Ignore DISEC failures when disabling IBIs
Date: Fri, 12 Jun 2026 11:01:02 +0300
Message-ID: <20260612080107.11606-3-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260612080107.11606-1-adrian.hunter@intel.com>
References: <20260612080107.11606-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_010132_593276_DBC34146 
X-CRM114-Status: GOOD (  12.61  )
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
OiBGcmFuayBMaSA8RnJhbmsuTGlAbnhwLmNvbT4KLS0tCgoKQ2hhbmdlcyBpbiBWNDoKCglOb25l
CgpDaGFuZ2VzIGluIFYzOgoKCUFkZCBGcmFuaydzIFJldidkLWJ5CgpDaGFuZ2VzIGluIFYyOgoK
CVJlLWJhc2UgZHVlIHRvIGNoYW5nZXMgaW4gcHJldmlvdXMgcGF0Y2guCgoKIGRyaXZlcnMvaTNj
L21hc3Rlci9taXBpLWkzYy1oY2kvY29yZS5jIHwgOCArKysrKysrLQogMSBmaWxlIGNoYW5nZWQs
IDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNj
L21hc3Rlci9taXBpLWkzYy1oY2kvY29yZS5jIGIvZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNj
LWhjaS9jb3JlLmMKaW5kZXggMWUxZjA1YWZmMDkyLi5mZmZiYzE3NzVlZjkgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvY29yZS5jCisrKyBiL2RyaXZlcnMvaTNj
L21hc3Rlci9taXBpLWkzYy1oY2kvY29yZS5jCkBAIC02OTcsNyArNjk3LDEzIEBAIHN0YXRpYyBp
bnQgaTNjX2hjaV9kaXNhYmxlX2liaShzdHJ1Y3QgaTNjX2Rldl9kZXNjICpkZXYpCiAJc3RydWN0
IGkzY19oY2kgKmhjaSA9IHRvX2kzY19oY2kobSk7CiAKIAlfX2kzY19oY2lfZGlzYWJsZV9pYmko
aGNpLCBkZXYpOwotCXJldHVybiBpM2NfbWFzdGVyX2Rpc2VjX2xvY2tlZChtLCBkZXYtPmluZm8u
ZHluX2FkZHIsIEkzQ19DQ0NfRVZFTlRfU0lSKTsKKwkvKgorCSAqIFRoZSBEQVQgZW50cnkgaXMg
bm93IHNldCB0byBOQUNLIGFuZCBESVNFQyB0aGlzIHRhcmdldCdzIElCSXMsIHNvCisJICogdGhl
IElCSSB0ZWFyZG93biBjYW4gcHJvY2VlZCBldmVuIGlmIERJU0VDIGJlbG93IGZhaWxzLCBzbyBp
Z25vcmUKKwkgKiBlcnJvcnMuCisJICovCisJaTNjX21hc3Rlcl9kaXNlY19sb2NrZWQobSwgZGV2
LT5pbmZvLmR5bl9hZGRyLCBJM0NfQ0NDX0VWRU5UX1NJUik7CisJcmV0dXJuIDA7CiB9CiAKIHN0
YXRpYyB2b2lkIGkzY19oY2lfcmVjeWNsZV9pYmlfc2xvdChzdHJ1Y3QgaTNjX2Rldl9kZXNjICpk
ZXYsCi0tIAoyLjUxLjAKCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWkzYwo=
