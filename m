Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD0FDFEFB57
	for <linux-i3c@archiver.kernel.org>; Fri, 27 Feb 2026 14:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7fY6Fs/LXAfYeGxRp/JMqYbes+y1lSuORUAclJqFH5Q=; b=siFitm/7V5j+kz
	ieleqcQM5xtQXEw7mkXdgJYu8UygkqgV+l5z54PhHL2BhFADcIzzJtndgD2YlVPeCdDwCCEJpw7gH
	jqtJ8s6F8rmwaeGnOXXchU8+nwpAfEipeK3JOWyIm8y+oa8Qc9UmLal8RL/aRhZvvgT0KOym+N6Ep
	Cvh9ezTCbEx79lM2cLwahTz4X8pJsxQSl5XIw2uRGGxeHVGMp2vjnU0JnlKfe1R+LlpiMfwebA0Hn
	+btZTVhtGhu6Tw4W4Rz9hsx+QJ88moTTR93q6tsmHzSmE4RkfuAXoN89B5BGPuyDaqiY1P2dhtBYt
	48yevRSN/A610S/ApsFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyZr-00000008Tco-2MGm;
	Fri, 27 Feb 2026 14:12:23 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyZo-00000008TRS-3YQ1
	for linux-i3c@lists.infradead.org;
	Fri, 27 Feb 2026 14:12:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772201541; x=1803737541;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vbbUFNSPLdoJAlhmBDXeFOoC6Z+Psw53yoQCyOqcLY8=;
  b=F1CrDDuRrsQC6EGONZMkrrLp1ICm3wLhnu0Rr+PceNt319ujdqDSh18a
   BUCfIx01tz62V1/JC/BliVYXLaTjOIGxOkJ0MBgUw7ysSiQOmgUkhNaUX
   AgY6bXvJUwSuTDeOMo0s5x1wl3NOh5cCUUVpiqm0OM4kIQBgnnzLUhr/7
   xYFnZwmFSGIYGgAmU/mlgG7ruqZqaE5aGdEwPxC6oHDW1WmrQC9PbxHMP
   0BtmpbkA5UUEtWlwooVjpI5Jm0LKKaJRzQ2Bh6n9KqvauWQ2FAiUu0/rJ
   mNygwAEKA0oyMTlg8ZuAq7kroGcKyzsjq+H+40oQ2pP5bg/piq7t7eUSA
   Q==;
X-CSE-ConnectionGUID: tjea6AvTSYSGEnFOezpbPw==
X-CSE-MsgGUID: GHYgcjqQRdeUrHTxlDAMjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="98750067"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="98750067"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 06:12:20 -0800
X-CSE-ConnectionGUID: lSsHaZKPQMmIRLqAVOzeog==
X-CSE-MsgGUID: UGO/0LgNSByCHh2PPwLC3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="217015802"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.80])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 06:12:19 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH 12/12] i3c: mipi-i3c-hci: Fallback to software reset when bus disable fails
Date: Fri, 27 Feb 2026 16:11:49 +0200
Message-ID: <20260227141149.184980-13-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260227141149.184980-1-adrian.hunter@intel.com>
References: <20260227141149.184980-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_061220_898548_C72F1C7A 
X-CRM114-Status: GOOD (  17.29  )
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

RGlzcnVwdGlvbiBvZiB0aGUgTUlQSSBJM0MgSENJIGNvbnRyb2xsZXLigJlzIGludGVybmFsIHN0
YXRlIGNhbiBjYXVzZQppM2NfaGNpX2J1c19kaXNhYmxlKCkgdG8gZmFpbCB3aGVuIGF0dGVtcHRp
bmcgdG8gc2h1dCBkb3duIHRoZSBidXMuCgpJbiB0aGUgY29kZSBwYXRocyB3aGVyZSBidXMgZGlz
YWJsZSBpcyBpbnZva2VkIC0gYnVzIGNsZWFuLXVwIGFuZCBydW50aW1lCnN1c3BlbmQgLSB0aGUg
Y29udHJvbGxlciBkb2VzIG5vdCBuZWVkIHRvIHJlbWFpbiBvcGVyYXRpb25hbCBhZnRlcndhcmQs
IHNvCmEgZnVsbCBjb250cm9sbGVyIHJlc2V0IGlzIGEgc2FmZSByZWNvdmVyeSBtZWNoYW5pc20u
CgpBZGQgYSBmYWxsYmFjayB0byBpc3N1ZSBhIHNvZnR3YXJlIHJlc2V0IHdoZW4gZGlzYWJsaW5n
IHRoZSBidXMgZmFpbHMuClRoaXMgZW5zdXJlcyB0aGUgYnVzIGlzIHJlbGlhYmx5IGhhbHRlZCBl
dmVuIGlmIHRoZSBjb250cm9sbGVy4oCZcyBzdGF0ZQptYWNoaW5lIGlzIHN0dWNrIG9yIHVucmVz
cG9uc2l2ZS4KClRoZSBmYWxsYmFjayBpcyB1c2VkIGJvdGggZHVyaW5nIGJ1cyBjbGVhbi11cCBh
bmQgaW4gdGhlIHJ1bnRpbWUgc3VzcGVuZApwYXRoLiAgSW4gdGhlIGxhdHRlciBjYXNlLCBlbnN1
cmUgaW50ZXJydXB0cyBhcmUgcXVpZXNjZWQgYWZ0ZXIgcmVzZXQuCgpGaXhlczogOWFkOWE1MmNj
ZTI4MiAoImkzYy9tYXN0ZXI6IGludHJvZHVjZSB0aGUgbWlwaS1pM2MtaGNpIGRyaXZlciIpCkNj
OiBzdGFibGVAdmdlci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IEFkcmlhbiBIdW50ZXIgPGFk
cmlhbi5odW50ZXJAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1o
Y2kvY29yZS5jIHwgNjUgKysrKysrKysrKysrKystLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAzNSBpbnNlcnRpb25zKCspLCAzMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2NvcmUuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci9taXBp
LWkzYy1oY2kvY29yZS5jCmluZGV4IDI5MDllM2QzNWQ4Yi4uNjQ4Y2U4N2UzYjdlIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2NvcmUuYworKysgYi9kcml2ZXJz
L2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2NvcmUuYwpAQCAtMTgyLDYgKzE4MiwzNCBAQCBzdGF0
aWMgaW50IGkzY19oY2lfYnVzX2Rpc2FibGUoc3RydWN0IGkzY19oY2kgKmhjaSkKIAlyZXR1cm4g
cmV0OwogfQogCitzdGF0aWMgaW50IGkzY19oY2lfc29mdHdhcmVfcmVzZXQoc3RydWN0IGkzY19o
Y2kgKmhjaSkKK3sKKwl1MzIgcmVndmFsOworCWludCByZXQ7CisKKwkvKgorCSAqIFNPRlRfUlNU
IG11c3QgYmUgY2xlYXIgYmVmb3JlIHdlIHdyaXRlIHRvIGl0LgorCSAqIFRoZW4gd2UgbXVzdCB3
YWl0IHVudGlsIGl0IGNsZWFycyBhZ2Fpbi4KKwkgKi8KKwlyZXQgPSByZWFkeF9wb2xsX3RpbWVv
dXQocmVnX3JlYWQsIFJFU0VUX0NPTlRST0wsIHJlZ3ZhbCwKKwkJCQkgIShyZWd2YWwgJiBTT0ZU
X1JTVCksIDAsIDEwICogVVNFQ19QRVJfTVNFQyk7CisJaWYgKHJldCkgeworCQlkZXZfZXJyKCZo
Y2ktPm1hc3Rlci5kZXYsICIlczogU29mdHdhcmUgcmVzZXQgc3R1Y2tcbiIsIF9fZnVuY19fKTsK
KwkJcmV0dXJuIHJldDsKKwl9CisKKwlyZWdfd3JpdGUoUkVTRVRfQ09OVFJPTCwgU09GVF9SU1Qp
OworCisJcmV0ID0gcmVhZHhfcG9sbF90aW1lb3V0KHJlZ19yZWFkLCBSRVNFVF9DT05UUk9MLCBy
ZWd2YWwsCisJCQkJICEocmVndmFsICYgU09GVF9SU1QpLCAwLCAxMCAqIFVTRUNfUEVSX01TRUMp
OworCWlmIChyZXQpIHsKKwkJZGV2X2VycigmaGNpLT5tYXN0ZXIuZGV2LCAiJXM6IFNvZnR3YXJl
IHJlc2V0IGZhaWxlZFxuIiwgX19mdW5jX18pOworCQlyZXR1cm4gcmV0OworCX0KKworCXJldHVy
biAwOworfQorCiB2b2lkIGkzY19oY2lfc3luY19pcnFfaW5hY3RpdmUoc3RydWN0IGkzY19oY2kg
KmhjaSkKIHsKIAlzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2ID0gdG9fcGxhdGZvcm1fZGV2
aWNlKGhjaS0+bWFzdGVyLmRldi5wYXJlbnQpOwpAQCAtMTk4LDcgKzIyNiw4IEBAIHN0YXRpYyB2
b2lkIGkzY19oY2lfYnVzX2NsZWFudXAoc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAqbSkK
IHsKIAlzdHJ1Y3QgaTNjX2hjaSAqaGNpID0gdG9faTNjX2hjaShtKTsKIAotCWkzY19oY2lfYnVz
X2Rpc2FibGUoaGNpKTsKKwlpZiAoaTNjX2hjaV9idXNfZGlzYWJsZShoY2kpKQorCQlpM2NfaGNp
X3NvZnR3YXJlX3Jlc2V0KGhjaSk7CiAJaGNpLT5pby0+Y2xlYW51cChoY2kpOwogfQogCkBAIC02
MjgsMzQgKzY1Nyw2IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBpM2NfaGNpX2lycV9oYW5kbGVyKGlu
dCBpcnEsIHZvaWQgKmRldl9pZCkKIAlyZXR1cm4gcmVzdWx0OwogfQogCi1zdGF0aWMgaW50IGkz
Y19oY2lfc29mdHdhcmVfcmVzZXQoc3RydWN0IGkzY19oY2kgKmhjaSkKLXsKLQl1MzIgcmVndmFs
OwotCWludCByZXQ7Ci0KLQkvKgotCSAqIFNPRlRfUlNUIG11c3QgYmUgY2xlYXIgYmVmb3JlIHdl
IHdyaXRlIHRvIGl0LgotCSAqIFRoZW4gd2UgbXVzdCB3YWl0IHVudGlsIGl0IGNsZWFycyBhZ2Fp
bi4KLQkgKi8KLQlyZXQgPSByZWFkeF9wb2xsX3RpbWVvdXQocmVnX3JlYWQsIFJFU0VUX0NPTlRS
T0wsIHJlZ3ZhbCwKLQkJCQkgIShyZWd2YWwgJiBTT0ZUX1JTVCksIDAsIDEwICogVVNFQ19QRVJf
TVNFQyk7Ci0JaWYgKHJldCkgewotCQlkZXZfZXJyKCZoY2ktPm1hc3Rlci5kZXYsICIlczogU29m
dHdhcmUgcmVzZXQgc3R1Y2tcbiIsIF9fZnVuY19fKTsKLQkJcmV0dXJuIHJldDsKLQl9Ci0KLQly
ZWdfd3JpdGUoUkVTRVRfQ09OVFJPTCwgU09GVF9SU1QpOwotCi0JcmV0ID0gcmVhZHhfcG9sbF90
aW1lb3V0KHJlZ19yZWFkLCBSRVNFVF9DT05UUk9MLCByZWd2YWwsCi0JCQkJICEocmVndmFsICYg
U09GVF9SU1QpLCAwLCAxMCAqIFVTRUNfUEVSX01TRUMpOwotCWlmIChyZXQpIHsKLQkJZGV2X2Vy
cigmaGNpLT5tYXN0ZXIuZGV2LCAiJXM6IFNvZnR3YXJlIHJlc2V0IGZhaWxlZFxuIiwgX19mdW5j
X18pOwotCQlyZXR1cm4gcmV0OwotCX0KLQotCXJldHVybiAwOwotfQotCiBzdGF0aWMgaW5saW5l
IGJvb2wgaXNfdmVyc2lvbl8xXzFfb3JfbmV3ZXIoc3RydWN0IGkzY19oY2kgKmhjaSkKIHsKIAly
ZXR1cm4gaGNpLT52ZXJzaW9uX21ham9yID4gMSB8fCAoaGNpLT52ZXJzaW9uX21ham9yID09IDEg
JiYgaGNpLT52ZXJzaW9uX21pbm9yID4gMCk7CkBAIC03NjYsOCArNzY3LDEyIEBAIHN0YXRpYyBp
bnQgaTNjX2hjaV9ydW50aW1lX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQogCWludCByZXQ7
CiAKIAlyZXQgPSBpM2NfaGNpX2J1c19kaXNhYmxlKGhjaSk7Ci0JaWYgKHJldCkKKwlpZiAocmV0
KSB7CisJCS8qIEZhbGwgYmFjayB0byBzb2Z0d2FyZSByZXNldCB0byBkaXNhYmxlIHRoZSBidXMg
Ki8KKwkJcmV0ID0gaTNjX2hjaV9zb2Z0d2FyZV9yZXNldChoY2kpOworCQlpM2NfaGNpX3N5bmNf
aXJxX2luYWN0aXZlKGhjaSk7CiAJCXJldHVybiByZXQ7CisJfQogCiAJaGNpLT5pby0+c3VzcGVu
ZChoY2kpOwogCi0tIAoyLjUxLjAKCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1p
M2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWkzYwo=
