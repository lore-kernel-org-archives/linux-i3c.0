Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9D2CD6E44
	for <linux-i3c@archiver.kernel.org>; Wed, 27 May 2026 11:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ayqmZD3DjVJyY+Sk/X/mQ9P42PgpvZFeqFp5+Q9A8sU=; b=mJ71VTZ0vWa3Lg
	PE9ZGKy3NOWQN2NVVkFova6654liK5a0RWaMS1m/VNKeTMlp40idl2xMbYJZjsxibraXyBGrtK1N1
	pmf02UVWOK/ED+ADIP19QeuF0d65Kn3ol6Ar0F8ymnX9Dy6hfI3jNO3JbwkzaeOrhhuLQLnw1euWv
	hklHepCh3jflFy/hMoSE3lw3o39L3RPXX8Nem07cI+OwvbjPX/Mmu7OfkF8KiQBMOiB4IMGN5vorb
	mMZtWRl1drrnccxAiQRGKvO5XaB2wQCnV8uy8G5l45feLq2SRYBCMU80F6bh0rKxpNE7S6q5wIToJ
	JiBEdY2XCfyfsG8q3nXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSCQp-0000000408I-3k6D;
	Wed, 27 May 2026 11:28:15 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSCQn-00000004079-37dd
	for linux-i3c@lists.infradead.org;
	Wed, 27 May 2026 11:28:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779881294; x=1811417294;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gDsxcfg85cTAJxGKjUadiwBxxzUTuggBnRV6qMS3N20=;
  b=bfOnKOboi1j3+Dtay7xCt/mU3ABsrmdhYYHi6/iE04IvOF9duQ34lIjN
   gfwsJxKOITjMLmBJlrytoVsqi1Rw8MaPZt3mHDY2e/B7R0yszQqW+w1mJ
   g+fQ2Xg5hFSITvo0/I7oxjHKpcgG8CxCL4ISCBBFb79sL+qwbUEyR/aD2
   gckbDhPJv1T+vXZMEwITGuPsnPN/CGMAUIb9jxhKzRNsVSXTe6+9cDZ/y
   gp8RY3VqTecYyoYqMHn9j/zvI7cveXYqtCDY3QyjApmCtn4oqTCGxdVXs
   RDilMsKhx7vWVhqkofTyyq7ftxSgjCkWyPQ/dDzejM0N3nkLDGqgn0FTh
   g==;
X-CSE-ConnectionGUID: Bg1dNL/NQOuk0/Wuf9agTg==
X-CSE-MsgGUID: rMXue1HlSKKqVdIVJP+oxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="103381712"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="103381712"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 04:28:13 -0700
X-CSE-ConnectionGUID: XuSdtqjdQEaqBZw6PGm7+g==
X-CSE-MsgGUID: 0uU54AGTRYi9p0o4XiJOnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="246238602"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.228])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 04:28:12 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] i3c: mipi-i3c-hci: Ignore DISEC failures when disabling IBIs
Date: Wed, 27 May 2026 14:27:53 +0300
Message-ID: <20260527112758.38530-3-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260527112758.38530-1-adrian.hunter@intel.com>
References: <20260527112758.38530-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_042813_833364_E9D1A7D5 
X-CRM114-Status: GOOD (  12.52  )
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
Zi1ieTogQWRyaWFuIEh1bnRlciA8YWRyaWFuLmh1bnRlckBpbnRlbC5jb20+Ci0tLQogZHJpdmVy
cy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9jb3JlLmMgfCA4ICsrKysrKystCiAxIGZpbGUgY2hh
bmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9jb3JlLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvbWlw
aS1pM2MtaGNpL2NvcmUuYwppbmRleCBiMTliZGZmNWM1ZTIuLjNlZjdmYWVkOTk1NyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9jb3JlLmMKKysrIGIvZHJpdmVy
cy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9jb3JlLmMKQEAgLTY4OSw3ICs2ODksMTMgQEAgc3Rh
dGljIGludCBpM2NfaGNpX2Rpc2FibGVfaWJpKHN0cnVjdCBpM2NfZGV2X2Rlc2MgKmRldikKIAlt
aXBpX2kzY19oY2lfZGF0X3YxLnNldF9mbGFncyhoY2ksIGRldl9kYXRhLT5kYXRfaWR4LCBEQVRf
MF9TSVJfUkVKRUNULCAwKTsKIAlzY29wZWRfZ3VhcmQoc3BpbmxvY2tfaXJxc2F2ZSwgJmhjaS0+
bG9jaykKIAkJaGNpLT5pYmlfZGV2c1tkZXZfZGF0YS0+ZGF0X2lkeF0gPSBOVUxMOwotCXJldHVy
biBpM2NfbWFzdGVyX2Rpc2VjX2xvY2tlZChtLCBkZXYtPmluZm8uZHluX2FkZHIsIEkzQ19DQ0Nf
RVZFTlRfU0lSKTsKKwkvKgorCSAqIFRoZSBEQVQgZW50cnkgaXMgbm93IHNldCB0byBOQUNLIGFu
ZCBESVNFQyB0aGlzIHRhcmdldCdzIElCSXMsIHNvCisJICogdGhlIElCSSB0ZWFyZG93biBjYW4g
cHJvY2VlZCBldmVuIGlmIERJU0VDIGJlbG93IGZhaWxzLCBzbyBpZ25vcmUKKwkgKiBlcnJvcnMu
CisJICovCisJaTNjX21hc3Rlcl9kaXNlY19sb2NrZWQobSwgZGV2LT5pbmZvLmR5bl9hZGRyLCBJ
M0NfQ0NDX0VWRU5UX1NJUik7CisJcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyB2b2lkIGkzY19oY2lf
cmVjeWNsZV9pYmlfc2xvdChzdHJ1Y3QgaTNjX2Rldl9kZXNjICpkZXYsCi0tIAoyLjUxLjAKCgot
LSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
