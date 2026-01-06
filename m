Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A86FC47BFD
	for <linux-i3c@archiver.kernel.org>; Tue,  6 Jan 2026 16:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VjWq7h8m9W9jpwRbeGB+ZK3JF8HRMdrSQhgnOXaLaA4=; b=BJQHTTrAadth+p
	n8ITKbkkhLpbI44fJoPT4IPOuAyTH9WrkECzCFvYZnkLMgJ4Mtm8NGpiOk9gqPka8t5hW82u3PfC+
	dne6fYRaMIXbSzXYcYPrxlCxGMr6OjYk/DEbK203XZBIPmU1gg31hJOSayeR1T5ZilarjwP/dX3hC
	3uzFZxa+LWxnXZYawJ0I+j16K+/Hh2dkaaJEMFj70ua0Bo/t/gbeumXtzbxUvFg/Lce0ty1RUB7r8
	dfTgogzQTQEP4UjIf5p2/d2eTVmCPB1QsjEL8LcxrvciSJQyQycRNR7okehLnj2HCmJb2x88GYIzq
	nbx4fCjGpTf1MPy00BYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAB5-0000000DWZt-3dNo;
	Tue, 06 Jan 2026 16:45:03 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAB3-0000000DWWw-0aYb
	for linux-i3c@lists.infradead.org;
	Tue, 06 Jan 2026 16:45:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767717901; x=1799253901;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r/QNeL9NuQtyIg//hE0X7r3LnDIZcDsY1bFIS4bG84s=;
  b=KGM8qrYM/RN3q5E0zrwKBWaoXSxp7cChUbwHrOh6xQ7tYYNu8QeUtsC8
   5Qa4j3vu7KyzzeTWqb3Fj/Ib0F22kEukfRLUMuxnrAu9XbZK9lxMoATGY
   3aI4/K3KCdURcyqbyCyB0GLtSLx6PSRiBUYjwF+sxuHtVhiTn+7LYLqnp
   GQnp36BrUmokNAylWc4Vmry3pA8ctjCWQB/jmv9f7gozWYubhBR+YKIfo
   d84GNECIMzVR0iktscHRMsD67rKNgsd0u5GAx0zYnaMYPb0dW3MjoUzmb
   oYC8POyR/tFo1Ie0M9QFrAZPPaHhuFHZvywZxVdK1FGVVIu2ydCzf+5EI
   Q==;
X-CSE-ConnectionGUID: v2Fi/rBbQUWJ0K0VplEWLw==
X-CSE-MsgGUID: DC89OKTGQGuvu/Ufml5Sfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="91741871"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="91741871"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 08:45:01 -0800
X-CSE-ConnectionGUID: XwBCbaEOStqEELkJHtWX+g==
X-CSE-MsgGUID: ETD/p0SpSIe9nu2BYtRuWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="206838057"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.254])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 08:44:59 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V4 11/11] i3c: mipi-i3c-hci-pci: Define Multi-Bus instances for supported controllers
Date: Tue,  6 Jan 2026 18:44:16 +0200
Message-ID: <20260106164416.67074-12-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260106164416.67074-1-adrian.hunter@intel.com>
References: <20260106164416.67074-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_084501_225741_5979EC9B 
X-CRM114-Status: UNSURE (   9.53  )
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
dGVsLmNvbT4KUmV2aWV3ZWQtYnk6IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29tPgotLS0KCgpD
aGFuZ2VzIGluIFY0OgoKCUFkZCBGcmFuaydzIFJldidkLWJ5CgpDaGFuZ2VzIGluIFYzOgoKCUFk
anVzdCBmb3IgZG9pbmcgYXdheSB3aXRoIGR5bmFtaWMgZGV2aWQgYWxsb2NhdGlvbgoKQ2hhbmdl
cyBpbiBWMjoKCglBbHNvIGRlZmluZSBpbnN0YW5jZSAwIGluIGRyaXZlcl9kYXRhCgoKIC4uLi9t
YXN0ZXIvbWlwaS1pM2MtaGNpL21pcGktaTNjLWhjaS1wY2kuYyAgICB8IDM1ICsrKysrKysrKysr
Ky0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL21pcGktaTNj
LWhjaS1wY2kuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvbWlwaS1pM2MtaGNp
LXBjaS5jCmluZGV4IDc4MmY0Njk4OTQyMy4uNDU4Zjg3MWEyZTYxIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL21pcGktaTNjLWhjaS1wY2kuYworKysgYi9kcml2
ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL21pcGktaTNjLWhjaS1wY2kuYwpAQCAtMTgxLDE2
ICsxODEsMjUgQEAgc3RhdGljIHZvaWQgaW50ZWxfaTNjX2V4aXQoc3RydWN0IG1pcGlfaTNjX2hj
aV9wY2kgKmhjaSkKIAlpbnRlbF9sdHJfaGlkZSgmaGNpLT5wY2ktPmRldik7CiB9CiAKLXN0YXRp
YyBjb25zdCBzdHJ1Y3QgbWlwaV9pM2NfaGNpX3BjaV9pbmZvIGludGVsXzFfaW5mbyA9IHsKK3N0
YXRpYyBjb25zdCBzdHJ1Y3QgbWlwaV9pM2NfaGNpX3BjaV9pbmZvIGludGVsX21pXzFfaW5mbyA9
IHsKIAkuaW5pdCA9IGludGVsX2kzY19pbml0LAogCS5leGl0ID0gaW50ZWxfaTNjX2V4aXQsCiAJ
Lm5hbWUgPSAiaW50ZWwtbHBzcy1pM2MiLAotCS5pZCA9IHswfSwKLQkuaW5zdGFuY2Vfb2Zmc2V0
ID0gezB9LAotCS5pbnN0YW5jZV9jb3VudCA9IDEsCisJLmlkID0gezAsIDF9LAorCS5pbnN0YW5j
ZV9vZmZzZXQgPSB7MCwgMHg0MDB9LAorCS5pbnN0YW5jZV9jb3VudCA9IDIsCit9OworCitzdGF0
aWMgY29uc3Qgc3RydWN0IG1pcGlfaTNjX2hjaV9wY2lfaW5mbyBpbnRlbF9taV8yX2luZm8gPSB7
CisJLmluaXQgPSBpbnRlbF9pM2NfaW5pdCwKKwkuZXhpdCA9IGludGVsX2kzY19leGl0LAorCS5u
YW1lID0gImludGVsLWxwc3MtaTNjIiwKKwkuaWQgPSB7MiwgM30sCisJLmluc3RhbmNlX29mZnNl
dCA9IHswLCAweDQwMH0sCisJLmluc3RhbmNlX2NvdW50ID0gMiwKIH07CiAKLXN0YXRpYyBjb25z
dCBzdHJ1Y3QgbWlwaV9pM2NfaGNpX3BjaV9pbmZvIGludGVsXzJfaW5mbyA9IHsKK3N0YXRpYyBj
b25zdCBzdHJ1Y3QgbWlwaV9pM2NfaGNpX3BjaV9pbmZvIGludGVsX3NpXzJfaW5mbyA9IHsKIAku
aW5pdCA9IGludGVsX2kzY19pbml0LAogCS5leGl0ID0gaW50ZWxfaTNjX2V4aXQsCiAJLm5hbWUg
PSAiaW50ZWwtbHBzcy1pM2MiLApAQCAtMjk2LDE3ICszMDUsMTcgQEAgc3RhdGljIHZvaWQgbWlw
aV9pM2NfaGNpX3BjaV9yZW1vdmUoc3RydWN0IHBjaV9kZXYgKnBjaSkKIAogc3RhdGljIGNvbnN0
IHN0cnVjdCBwY2lfZGV2aWNlX2lkIG1pcGlfaTNjX2hjaV9wY2lfZGV2aWNlc1tdID0gewogCS8q
IFdpbGRjYXQgTGFrZS1VICovCi0JeyBQQ0lfVkRFVklDRShJTlRFTCwgMHg0ZDdjKSwgKGtlcm5l
bF91bG9uZ190KSZpbnRlbF8xX2luZm99LAotCXsgUENJX1ZERVZJQ0UoSU5URUwsIDB4NGQ2Ziks
IChrZXJuZWxfdWxvbmdfdCkmaW50ZWxfMl9pbmZvfSwKKwl7IFBDSV9WREVWSUNFKElOVEVMLCAw
eDRkN2MpLCAoa2VybmVsX3Vsb25nX3QpJmludGVsX21pXzFfaW5mb30sCisJeyBQQ0lfVkRFVklD
RShJTlRFTCwgMHg0ZDZmKSwgKGtlcm5lbF91bG9uZ190KSZpbnRlbF9zaV8yX2luZm99LAogCS8q
IFBhbnRoZXIgTGFrZS1IICovCi0JeyBQQ0lfVkRFVklDRShJTlRFTCwgMHhlMzdjKSwgKGtlcm5l
bF91bG9uZ190KSZpbnRlbF8xX2luZm99LAotCXsgUENJX1ZERVZJQ0UoSU5URUwsIDB4ZTM2Ziks
IChrZXJuZWxfdWxvbmdfdCkmaW50ZWxfMl9pbmZvfSwKKwl7IFBDSV9WREVWSUNFKElOVEVMLCAw
eGUzN2MpLCAoa2VybmVsX3Vsb25nX3QpJmludGVsX21pXzFfaW5mb30sCisJeyBQQ0lfVkRFVklD
RShJTlRFTCwgMHhlMzZmKSwgKGtlcm5lbF91bG9uZ190KSZpbnRlbF9zaV8yX2luZm99LAogCS8q
IFBhbnRoZXIgTGFrZS1QICovCi0JeyBQQ0lfVkRFVklDRShJTlRFTCwgMHhlNDdjKSwgKGtlcm5l
bF91bG9uZ190KSZpbnRlbF8xX2luZm99LAotCXsgUENJX1ZERVZJQ0UoSU5URUwsIDB4ZTQ2Ziks
IChrZXJuZWxfdWxvbmdfdCkmaW50ZWxfMl9pbmZvfSwKKwl7IFBDSV9WREVWSUNFKElOVEVMLCAw
eGU0N2MpLCAoa2VybmVsX3Vsb25nX3QpJmludGVsX21pXzFfaW5mb30sCisJeyBQQ0lfVkRFVklD
RShJTlRFTCwgMHhlNDZmKSwgKGtlcm5lbF91bG9uZ190KSZpbnRlbF9zaV8yX2luZm99LAogCS8q
IE5vdmEgTGFrZS1TICovCi0JeyBQQ0lfVkRFVklDRShJTlRFTCwgMHg2ZTJjKSwgKGtlcm5lbF91
bG9uZ190KSZpbnRlbF8xX2luZm99LAotCXsgUENJX1ZERVZJQ0UoSU5URUwsIDB4NmUyZCksIChr
ZXJuZWxfdWxvbmdfdCkmaW50ZWxfMl9pbmZvfSwKKwl7IFBDSV9WREVWSUNFKElOVEVMLCAweDZl
MmMpLCAoa2VybmVsX3Vsb25nX3QpJmludGVsX21pXzFfaW5mb30sCisJeyBQQ0lfVkRFVklDRShJ
TlRFTCwgMHg2ZTJkKSwgKGtlcm5lbF91bG9uZ190KSZpbnRlbF9taV8yX2luZm99LAogCXsgfSwK
IH07CiBNT0RVTEVfREVWSUNFX1RBQkxFKHBjaSwgbWlwaV9pM2NfaGNpX3BjaV9kZXZpY2VzKTsK
LS0gCjIuNTEuMAoKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtaTNjCg==
