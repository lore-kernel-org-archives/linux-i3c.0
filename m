Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B11AFEFB56
	for <linux-i3c@archiver.kernel.org>; Fri, 27 Feb 2026 14:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V7iH1yNbmcjdkHciNHm/LSa1kFj4c7JaRWs7Ju6QHuI=; b=XdY7IwZOTGcwPe
	50jOtt2YnAuFfEl3WKxVQAzRG3B0ezhkDOUTehPZVGHzd+aDYdr3E6vvlf/pV3XuAInx4q0JqHJIz
	Gd3k0YGvt33wMdusnj0zFwkCbp9y7sjzTerUDfM5Z7SKZYAMSJ3lVjYlux7u2mfDwRh8cz99SOyzU
	ykGFK59IE9Rl1gnxZjg/Ht91ujrR7XXQ6z9TmT0J0gVVnFfVMkTn3A4adxA8aLxC3yACGh7CBjnrV
	Ow7suDMAt029MecAqEpjDEPwYKv5yzghiWHkgjEMcTQgnUuEUNGUmqINnHOdbG9URmAfgBoy4rmPP
	BtXCwg0JiyN3TTj9qq2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyZl-00000008TWS-1LRp;
	Fri, 27 Feb 2026 14:12:17 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyZh-00000008TRw-2cOv
	for linux-i3c@lists.infradead.org;
	Fri, 27 Feb 2026 14:12:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772201533; x=1803737533;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E/JUKRLknY4YJn0zIqe1ZIsLwoCpFolCNcdgh2oGjOc=;
  b=AostIfP3xwbQMSwK1yutVoExM42UkKapsNK6w3zb1EbuLI45Ka3yN9bd
   7tIkHzU8EtGEmSOl70nm7dTS8tQD4r1cZwAj3whLqrbIzKDOnWSiGq0Un
   uuu9YW8DmkBzNl55HRS0dcA7Q+Q8XAAECPwA7VtoQxRuCdu51PIrsdm2p
   /ep0b7KassQhRh/NitwYaQyprncCqB/jjhy2T90SgSv3g3ayjafHqWV2L
   nUFfDMz732xa8xrO4m5DwR0i3nwqlI8s1ekURqRdAL90wr32mp6UUXQML
   O6omOKZDr7XWIXc4N7z1FhAsbr6Qoj4IYfGJ/ST+zrHb5kdt/CezYVjft
   Q==;
X-CSE-ConnectionGUID: cjFF0gUPS7efis4L2wBcKA==
X-CSE-MsgGUID: AtSvDfOuTOunLcDkRP5WQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="98750031"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="98750031"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 06:12:08 -0800
X-CSE-ConnectionGUID: 8A+DUTyHTKS0TPhmgzmvfg==
X-CSE-MsgGUID: YNDfKeYJQ7mXS9WppUm1SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="217015636"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.80])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 06:12:07 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH 05/12] i3c: mipi-i3c-hci: Fix race between DMA ring dequeue and the interrupt handler
Date: Fri, 27 Feb 2026 16:11:42 +0200
Message-ID: <20260227141149.184980-6-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260227141149.184980-1-adrian.hunter@intel.com>
References: <20260227141149.184980-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_061213_673215_FD84B45C 
X-CRM114-Status: GOOD (  15.03  )
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

VGhlIERNQSByaW5nIGJvb2trZWVwaW5nIGluIHRoZSBNSVBJIEkzQyBIQ0kgZHJpdmVyIGlzIHVw
ZGF0ZWQgZnJvbSB0d28KY29udGV4dHM6IHRoZSBETUEgcmluZyBkZXF1ZXVlIHBhdGggKGhjaV9k
bWFfZGVxdWV1ZV94ZmVyKCkpIGFuZCB0aGUKaW50ZXJydXB0IGhhbmRsZXIgKGhjaV9kbWFfeGZl
cl9kb25lKCkpLiAgQm90aCBtb2RpZnkgdGhlIHJpbmfigJlzCmlu4oCRZmxpZ2h0IHRyYW5zZmVy
IHN0YXRlIC0gc3BlY2lmaWNhbGx5IHJoLT5zcmNfeGZlcnNbXSBhbmQKeGZlci0+cmluZ19lbnRy
eSAtIGJ1dCB3aXRob3V0IGFueSBzZXJpYWxpemF0aW9uLiAgVGhpcyBhbGxvd3MgdGhlIHR3bwpw
YXRocyB0byByYWNlLCBwb3RlbnRpYWxseSBsZWFkaW5nIHRvIGluY29uc2lzdGVudCByaW5nIHN0
YXRlLgoKU2VyaWFsaXplIGFjY2VzcyB0byB0aGUgc2hhcmVkIHJpbmcgc3RhdGUgYnkgZXh0ZW5k
aW5nIHRoZSBleGlzdGluZyByaW5nCnNwaW5sb2NrIHRvIGNvdmVyIHRoZSBkZXF1ZXVlIHBhdGgg
YW5kIHRoZSByZWxldmFudCBwYXJ0cyBvZiB0aGUKaW50ZXJydXB0IGhhbmRsZXIuICBJbiB0aGUg
aW50ZXJydXB0IGhhbmRsZXIsIGNsZWFyIHRoZSBjb21wbGV0ZWQgZW50cnkgaW4Kc3JjX3hmZXJz
W10gc28gaXQgY2Fubm90IGJlIG1hdGNoZWQgb3IgY29tcGxldGVkIGFnYWluLgoKRmluYWxseSwg
cGxhY2UgdGhlIHJpbmcgcmVzdGFydCBzZXF1ZW5jZSB1bmRlciB0aGUgc2FtZSBsb2NrIGluCmhj
aV9kbWFfZGVxdWV1ZV94ZmVyKCkgdG8gYXZvaWQgY29uY3VycmVudCBlbnF1ZXVlIG9yIGNvbXBs
ZXRpb24Kb3BlcmF0aW9ucyB3aGlsZSB0aGUgcmluZyBzdGF0ZSBpcyBiZWluZyBtb2RpZmllZC4K
CkZpeGVzOiA5YWQ5YTUyY2NlMjgyICgiaTNjL21hc3RlcjogaW50cm9kdWNlIHRoZSBtaXBpLWkz
Yy1oY2kgZHJpdmVyIikKQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKU2lnbmVkLW9mZi1ieTog
QWRyaWFuIEh1bnRlciA8YWRyaWFuLmh1bnRlckBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9pM2Mv
bWFzdGVyL21pcGktaTNjLWhjaS9kbWEuYyB8IDkgKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwg
NyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNj
L21hc3Rlci9taXBpLWkzYy1oY2kvZG1hLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2Mt
aGNpL2RtYS5jCmluZGV4IDVhOWFmNTYxZTRjYi4uOGQ1ZjgwOGUwM2VhIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2RtYS5jCisrKyBiL2RyaXZlcnMvaTNjL21h
c3Rlci9taXBpLWkzYy1oY2kvZG1hLmMKQEAgLTU2NCw2ICs1NjQsOCBAQCBzdGF0aWMgYm9vbCBo
Y2lfZG1hX2RlcXVldWVfeGZlcihzdHJ1Y3QgaTNjX2hjaSAqaGNpLAogCQlXQVJOX09OKDEpOwog
CX0KIAorCXNwaW5fbG9ja19pcnEoJnJoLT5sb2NrKTsKKwogCWZvciAoaSA9IDA7IGkgPCBuOyBp
KyspIHsKIAkJc3RydWN0IGhjaV94ZmVyICp4ZmVyID0geGZlcl9saXN0ICsgaTsKIAkJaW50IGlk
eCA9IHhmZXItPnJpbmdfZW50cnk7CkBAIC01OTcsNiArNTk5LDggQEAgc3RhdGljIGJvb2wgaGNp
X2RtYV9kZXF1ZXVlX3hmZXIoc3RydWN0IGkzY19oY2kgKmhjaSwKIAkvKiByZXN0YXJ0IHRoZSBy
aW5nICovCiAJcmhfcmVnX3dyaXRlKFJJTkdfQ09OVFJPTCwgUklOR19DVFJMX0VOQUJMRSk7CiAK
KwlzcGluX3VubG9ja19pcnEoJnJoLT5sb2NrKTsKKwogCXJldHVybiBkaWRfdW5xdWV1ZTsKIH0K
IApAQCAtNjA3LDYgKzYxMSw4IEBAIHN0YXRpYyB2b2lkIGhjaV9kbWFfeGZlcl9kb25lKHN0cnVj
dCBpM2NfaGNpICpoY2ksIHN0cnVjdCBoY2lfcmhfZGF0YSAqcmgpCiAJdW5zaWduZWQgaW50IGRv
bmVfY250ID0gMDsKIAlzdHJ1Y3QgaGNpX3hmZXIgKnhmZXI7CiAKKwlzcGluX2xvY2soJnJoLT5s
b2NrKTsKKwogCWZvciAoOzspIHsKIAkJb3AyX3ZhbCA9IHJoX3JlZ19yZWFkKFJJTkdfT1BFUkFU
SU9OMik7CiAJCWlmIChkb25lX3B0ciA9PSBGSUVMRF9HRVQoUklOR19PUDJfQ1JfREVRX1BUUiwg
b3AyX3ZhbCkpCkBAIC02MjIsNiArNjI4LDcgQEAgc3RhdGljIHZvaWQgaGNpX2RtYV94ZmVyX2Rv
bmUoc3RydWN0IGkzY19oY2kgKmhjaSwgc3RydWN0IGhjaV9yaF9kYXRhICpyaCkKIAkJCWRldl9k
YmcoJmhjaS0+bWFzdGVyLmRldiwgIm9ycGhhbmVkIHJpbmcgZW50cnkiKTsKIAkJfSBlbHNlIHsK
IAkJCWhjaV9kbWFfdW5tYXBfeGZlcihoY2ksIHhmZXIsIDEpOworCQkJcmgtPnNyY194ZmVyc1tk
b25lX3B0cl0gPSBOVUxMOwogCQkJeGZlci0+cmluZ19lbnRyeSA9IC0xOwogCQkJeGZlci0+cmVz
cG9uc2UgPSByZXNwOwogCQkJaWYgKHRpZCAhPSB4ZmVyLT5jbWRfdGlkKSB7CkBAIC02MzksOCAr
NjQ2LDYgQEAgc3RhdGljIHZvaWQgaGNpX2RtYV94ZmVyX2RvbmUoc3RydWN0IGkzY19oY2kgKmhj
aSwgc3RydWN0IGhjaV9yaF9kYXRhICpyaCkKIAkJZG9uZV9jbnQgKz0gMTsKIAl9CiAKLQkvKiB0
YWtlIGNhcmUgdG8gdXBkYXRlIHRoZSBzb2Z0d2FyZSBkZXF1ZXVlIHBvaW50ZXIgYXRvbWljYWxs
eSAqLwotCXNwaW5fbG9jaygmcmgtPmxvY2spOwogCXJoLT54ZmVyX3NwYWNlICs9IGRvbmVfY250
OwogCW9wMV92YWwgPSByaF9yZWdfcmVhZChSSU5HX09QRVJBVElPTjEpOwogCW9wMV92YWwgJj0g
flJJTkdfT1AxX0NSX1NXX0RFUV9QVFI7Ci0tIAoyLjUxLjAKCgotLSAKbGludXgtaTNjIG1haWxp
bmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
