Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 351AAD609CE
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Dec 2025 16:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WyxkiFNUXY5up/GtqGdyM7KP6bxLV/ruKqBRUlDK8HI=; b=fSc4svkCkMQA7f
	sxWjLcEXdF2dY3USEyBt1AIsdljNmSAmVywJrmEVDp8uIAmB3wuetib+P94MQN+oIXM56jcT2kDdX
	T4dlEk1cU6RnDUdzFewnIk91N+5AC855EmOCDp3GSwrQoUu7cQU2S1aLUau+VcmIMTYmVqW6m1JXT
	nykftFTD+/uMC2D21d/SeNmf8KwGzwobkEOHWoxy1XxIrgOicZEzkPkEsxTWb36JmVVNwdjLvNV8B
	RaVlEL9jUu1XeFLqLJ3btC5vWNstNZbJ2yRqYxi8/Y5BpVml0QPy9EfYnKcWNQ303zwRey256gYgy
	Z9dgEI+C+NhBANqcjG7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYML-00000005ZXt-3qaZ;
	Tue, 16 Dec 2025 16:57:13 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYMJ-00000005ZNb-0wgd
	for linux-i3c@lists.infradead.org;
	Tue, 16 Dec 2025 16:57:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765904231; x=1797440231;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1wDbGVVyo5igv6q132WynXBGHfS10aKVdv58cTvqv60=;
  b=Ci83CqhBSb5I093osnJTVTJLFmW0BU3ikA9cxCz0CnUtqGe2TtPdczbE
   xIHYjYJL5qEhbXZwknO7Pz21+U4Ypt6/Tdg9IIuQd70bjU6dPcw5NrclJ
   SlNcLPQbOUDIg0xz81ulBz9Glp2ndo5Sn8WvbHNy0TGIgIeaokL3xp6me
   3M86iYB58GeUDu9b1vh2BsZy3kti92Ut7/gs3APH5AOsH1gQbfsIc2aQB
   wTYSKmYmBE8cCJztelvEpHNIckBwZXpwMW+AZk2YMrgBFOx9GDR5pRDgb
   I1xfsQidilfqjdLoRfwzdlWpKyHV9ZR67mDMSw3AIarp02FWCkwqI2LBq
   A==;
X-CSE-ConnectionGUID: tVB6R0zAR3qfEMaHAptzuQ==
X-CSE-MsgGUID: xAvUGe4YTWC5xQkhJQ+kqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="78466783"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="78466783"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 08:57:11 -0800
X-CSE-ConnectionGUID: Fs7Qtnv6Tdu5TUPJe8tdlg==
X-CSE-MsgGUID: tbCVpZ6ITvSapyuCEF7N0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="197817732"
Received: from rvuia-mobl.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.195])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 08:57:10 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 11/11] i3c: mipi-i3c-hci-pci: Define Multi-Bus instances for supported controllers
Date: Tue, 16 Dec 2025 18:56:42 +0200
Message-ID: <20251216165642.164583-12-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251216165642.164583-1-adrian.hunter@intel.com>
References: <20251216165642.164583-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_085711_275461_F1D5DB21 
X-CRM114-Status: UNSURE (   9.06  )
X-CRM114-Notice: Please train this message.
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

RGVmaW5lIE11bHRpLUJ1cyBJbnN0YW5jZXMgYXQgb2Zmc2V0IDB4NDAwIGZvciBJbnRlbCBjb250
cm9sbGVycy4KCkludGVsIFNvQ3MgaW5jbHVkZSB0d28gSTNDIFBDSSBkZXZpY2VzIGluIHRoZSBM
b3cgUG93ZXIgU3Vic3lzdGVtIChMUFNTKSwKZWFjaCBjYXBhYmxlIG9mIGhvc3RpbmcgdHdvIEkz
QyBidXNlcy4gUGFudGhlciBMYWtlIGFuZCBXaWxkY2F0IExha2UKc3VwcG9ydCB0aHJlZSBidXNl
cyBpbiB0b3RhbCAoSURzIDDigJMyKSwgd2hpbGUgTm92YSBMYWtlIHN1cHBvcnRzIGZvdXIKKElE
cyAw4oCTMykuCgpTaWduZWQtb2ZmLWJ5OiBBZHJpYW4gSHVudGVyIDxhZHJpYW4uaHVudGVyQGlu
dGVsLmNvbT4KLS0tCgoKQ2hhbmdlcyBpbiBWMzoKCglBZGp1c3QgZm9yIGRvaW5nIGF3YXkgd2l0
aCBkeW5hbWljIGRldmlkIGFsbG9jYXRpb24KCkNoYW5nZXMgaW4gVjI6CgoJQWxzbyBkZWZpbmUg
aW5zdGFuY2UgMCBpbiBkcml2ZXJfZGF0YQoKCiAuLi4vbWFzdGVyL21pcGktaTNjLWhjaS9taXBp
LWkzYy1oY2ktcGNpLmMgICAgfCAzNSArKysrKysrKysrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMjIgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9taXBpLWkzYy1oY2ktcGNpLmMgYi9kcml2ZXJzL2kz
Yy9tYXN0ZXIvbWlwaS1pM2MtaGNpL21pcGktaTNjLWhjaS1wY2kuYwppbmRleCA3ODJmNDY5ODk0
MjMuLjQ1OGY4NzFhMmU2MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNj
LWhjaS9taXBpLWkzYy1oY2ktcGNpLmMKKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNj
LWhjaS9taXBpLWkzYy1oY2ktcGNpLmMKQEAgLTE4MSwxNiArMTgxLDI1IEBAIHN0YXRpYyB2b2lk
IGludGVsX2kzY19leGl0KHN0cnVjdCBtaXBpX2kzY19oY2lfcGNpICpoY2kpCiAJaW50ZWxfbHRy
X2hpZGUoJmhjaS0+cGNpLT5kZXYpOwogfQogCi1zdGF0aWMgY29uc3Qgc3RydWN0IG1pcGlfaTNj
X2hjaV9wY2lfaW5mbyBpbnRlbF8xX2luZm8gPSB7CitzdGF0aWMgY29uc3Qgc3RydWN0IG1pcGlf
aTNjX2hjaV9wY2lfaW5mbyBpbnRlbF9taV8xX2luZm8gPSB7CiAJLmluaXQgPSBpbnRlbF9pM2Nf
aW5pdCwKIAkuZXhpdCA9IGludGVsX2kzY19leGl0LAogCS5uYW1lID0gImludGVsLWxwc3MtaTNj
IiwKLQkuaWQgPSB7MH0sCi0JLmluc3RhbmNlX29mZnNldCA9IHswfSwKLQkuaW5zdGFuY2VfY291
bnQgPSAxLAorCS5pZCA9IHswLCAxfSwKKwkuaW5zdGFuY2Vfb2Zmc2V0ID0gezAsIDB4NDAwfSwK
KwkuaW5zdGFuY2VfY291bnQgPSAyLAorfTsKKworc3RhdGljIGNvbnN0IHN0cnVjdCBtaXBpX2kz
Y19oY2lfcGNpX2luZm8gaW50ZWxfbWlfMl9pbmZvID0geworCS5pbml0ID0gaW50ZWxfaTNjX2lu
aXQsCisJLmV4aXQgPSBpbnRlbF9pM2NfZXhpdCwKKwkubmFtZSA9ICJpbnRlbC1scHNzLWkzYyIs
CisJLmlkID0gezIsIDN9LAorCS5pbnN0YW5jZV9vZmZzZXQgPSB7MCwgMHg0MDB9LAorCS5pbnN0
YW5jZV9jb3VudCA9IDIsCiB9OwogCi1zdGF0aWMgY29uc3Qgc3RydWN0IG1pcGlfaTNjX2hjaV9w
Y2lfaW5mbyBpbnRlbF8yX2luZm8gPSB7CitzdGF0aWMgY29uc3Qgc3RydWN0IG1pcGlfaTNjX2hj
aV9wY2lfaW5mbyBpbnRlbF9zaV8yX2luZm8gPSB7CiAJLmluaXQgPSBpbnRlbF9pM2NfaW5pdCwK
IAkuZXhpdCA9IGludGVsX2kzY19leGl0LAogCS5uYW1lID0gImludGVsLWxwc3MtaTNjIiwKQEAg
LTI5NiwxNyArMzA1LDE3IEBAIHN0YXRpYyB2b2lkIG1pcGlfaTNjX2hjaV9wY2lfcmVtb3ZlKHN0
cnVjdCBwY2lfZGV2ICpwY2kpCiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCBt
aXBpX2kzY19oY2lfcGNpX2RldmljZXNbXSA9IHsKIAkvKiBXaWxkY2F0IExha2UtVSAqLwotCXsg
UENJX1ZERVZJQ0UoSU5URUwsIDB4NGQ3YyksIChrZXJuZWxfdWxvbmdfdCkmaW50ZWxfMV9pbmZv
fSwKLQl7IFBDSV9WREVWSUNFKElOVEVMLCAweDRkNmYpLCAoa2VybmVsX3Vsb25nX3QpJmludGVs
XzJfaW5mb30sCisJeyBQQ0lfVkRFVklDRShJTlRFTCwgMHg0ZDdjKSwgKGtlcm5lbF91bG9uZ190
KSZpbnRlbF9taV8xX2luZm99LAorCXsgUENJX1ZERVZJQ0UoSU5URUwsIDB4NGQ2ZiksIChrZXJu
ZWxfdWxvbmdfdCkmaW50ZWxfc2lfMl9pbmZvfSwKIAkvKiBQYW50aGVyIExha2UtSCAqLwotCXsg
UENJX1ZERVZJQ0UoSU5URUwsIDB4ZTM3YyksIChrZXJuZWxfdWxvbmdfdCkmaW50ZWxfMV9pbmZv
fSwKLQl7IFBDSV9WREVWSUNFKElOVEVMLCAweGUzNmYpLCAoa2VybmVsX3Vsb25nX3QpJmludGVs
XzJfaW5mb30sCisJeyBQQ0lfVkRFVklDRShJTlRFTCwgMHhlMzdjKSwgKGtlcm5lbF91bG9uZ190
KSZpbnRlbF9taV8xX2luZm99LAorCXsgUENJX1ZERVZJQ0UoSU5URUwsIDB4ZTM2ZiksIChrZXJu
ZWxfdWxvbmdfdCkmaW50ZWxfc2lfMl9pbmZvfSwKIAkvKiBQYW50aGVyIExha2UtUCAqLwotCXsg
UENJX1ZERVZJQ0UoSU5URUwsIDB4ZTQ3YyksIChrZXJuZWxfdWxvbmdfdCkmaW50ZWxfMV9pbmZv
fSwKLQl7IFBDSV9WREVWSUNFKElOVEVMLCAweGU0NmYpLCAoa2VybmVsX3Vsb25nX3QpJmludGVs
XzJfaW5mb30sCisJeyBQQ0lfVkRFVklDRShJTlRFTCwgMHhlNDdjKSwgKGtlcm5lbF91bG9uZ190
KSZpbnRlbF9taV8xX2luZm99LAorCXsgUENJX1ZERVZJQ0UoSU5URUwsIDB4ZTQ2ZiksIChrZXJu
ZWxfdWxvbmdfdCkmaW50ZWxfc2lfMl9pbmZvfSwKIAkvKiBOb3ZhIExha2UtUyAqLwotCXsgUENJ
X1ZERVZJQ0UoSU5URUwsIDB4NmUyYyksIChrZXJuZWxfdWxvbmdfdCkmaW50ZWxfMV9pbmZvfSwK
LQl7IFBDSV9WREVWSUNFKElOVEVMLCAweDZlMmQpLCAoa2VybmVsX3Vsb25nX3QpJmludGVsXzJf
aW5mb30sCisJeyBQQ0lfVkRFVklDRShJTlRFTCwgMHg2ZTJjKSwgKGtlcm5lbF91bG9uZ190KSZp
bnRlbF9taV8xX2luZm99LAorCXsgUENJX1ZERVZJQ0UoSU5URUwsIDB4NmUyZCksIChrZXJuZWxf
dWxvbmdfdCkmaW50ZWxfbWlfMl9pbmZvfSwKIAl7IH0sCiB9OwogTU9EVUxFX0RFVklDRV9UQUJM
RShwY2ksIG1pcGlfaTNjX2hjaV9wY2lfZGV2aWNlcyk7Ci0tIAoyLjUxLjAKCgotLSAKbGludXgt
aTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
