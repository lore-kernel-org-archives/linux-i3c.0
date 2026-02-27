Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CD1FEFB58
	for <linux-i3c@archiver.kernel.org>; Fri, 27 Feb 2026 14:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qk6RQoNXoZ/j22Gm6FysAScwL5WpPDy1TC7z6pE84M0=; b=duo/khtrThQiCy
	HjJl9x9D5F0qYSokdqOHSjz7q+cEmAmvN4Y9/3ARVYgoyqAsXrPb7ShZGfHklGD1dmBY9+7M29/Qa
	p972yiQRgUsNk0UaOtTebNlLja1D/2ZhP8dFib/OxHTbt2XhEGaYtfOuRohsEGIJ3GECZ85MZuAnM
	SQ9j7cz+o8XfLTgaYKoamw6xo6X01TMzlg7CZUqObo6PtjsDWHbn+kV7Tcu+CtPwG2PMDuFMTyvGq
	/xLYEclWaKT+g+vzJmr0VGGyldmHbKTgRzWQDK7hNWtVG1u5QaQ/1lnjzmS+iIquLESfCG2+X4caY
	CQa3ckP8I9i2XrxQ2A6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyZj-00000008TUk-1GiJ;
	Fri, 27 Feb 2026 14:12:15 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyZg-00000008TRw-0Iaz
	for linux-i3c@lists.infradead.org;
	Fri, 27 Feb 2026 14:12:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772201532; x=1803737532;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UXcQA0JGV0sJmG1w9onycRn1qA4yJGktnNLIjUwQWfI=;
  b=eY4+ElelMZbvyrreMiC0Q8q5mX/2bYuGSPCGOFNr4jA/SE1+ZmETotKk
   5d310OtrFSR4m0sonlODMxINlJ/HXgTDbKa2JEwGLfkBFprd9hJmg9BTM
   cQ3Y5cNU5ZMaS5wCjZOvU3V5jBqGkmI5XNmYUkhBZcYCpS5SgzeiRjPh7
   HdH9bOp4ogq+mGyZwemAu/9u3Z+9dKcJx0d9q7DMksIqcNEcsUvJvR56D
   xz+G+DE2Mb7I9Y4+nTnpQtckViZlDG+NbNyTTNrwE3Ij+nbIVFwiDBji/
   uMpt7G9299lbkY0lyHOvreER/KxZyh6lMtIKPk/3ITiFZ/lKiro4MDeLX
   w==;
X-CSE-ConnectionGUID: Rg+h2Zo8QF+n0w0+yav8GA==
X-CSE-MsgGUID: zQCqlrB5SVmW1jVgsyi7xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="98750012"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="98750012"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 06:12:03 -0800
X-CSE-ConnectionGUID: Pht0r2+4QQKJsQCGWpzCTA==
X-CSE-MsgGUID: 7cAeu2+SS0KGiHGrsCyfYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="217015565"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.80])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 06:12:02 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH 02/12] i3c: mipi-i3c-hci: Fix Hot-Join NACK
Date: Fri, 27 Feb 2026 16:11:39 +0200
Message-ID: <20260227141149.184980-3-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260227141149.184980-1-adrian.hunter@intel.com>
References: <20260227141149.184980-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_061212_118586_8F46F35D 
X-CRM114-Status: UNSURE (   8.89  )
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

VGhlIE1JUEkgSTNDIEhDSSBob3N0IGNvbnRyb2xsZXIgZHJpdmVyIGRvZXMgbm90IGltcGxlbWVu
dCBIb3QtSm9pbgpoYW5kbGluZywgeWV0IEhvdC1Kb2luIHJlc3BvbnNlIGNvbnRyb2wgZGVmYXVs
dHMgdG8gYWxsb3dpbmcgZGV2aWNlcyB0bwpIb3TigJFKb2luIHRoZSBidXMuICBDb25maWd1cmUg
SENfQ09OVFJPTF9IT1RfSk9JTl9DVFJMIHRvIE5BQ0sgYWxsIEhvdOKAkUpvaW4KYXR0ZW1wdHMu
CgpGaXhlczogOWFkOWE1MmNjZTI4MiAoImkzYy9tYXN0ZXI6IGludHJvZHVjZSB0aGUgbWlwaS1p
M2MtaGNpIGRyaXZlciIpCkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6
IEFkcmlhbiBIdW50ZXIgPGFkcmlhbi5odW50ZXJAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvaTNj
L21hc3Rlci9taXBpLWkzYy1oY2kvY29yZS5jIHwgNiArKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2Mv
bWFzdGVyL21pcGktaTNjLWhjaS9jb3JlLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2Mt
aGNpL2NvcmUuYwppbmRleCBkYmU5M2RmMGM3MGUuLjQ4NzdhMzIxZWRmOSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9jb3JlLmMKKysrIGIvZHJpdmVycy9pM2Mv
bWFzdGVyL21pcGktaTNjLWhjaS9jb3JlLmMKQEAgLTE1Miw3ICsxNTIsOCBAQCBzdGF0aWMgaW50
IGkzY19oY2lfYnVzX2luaXQoc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAqbSkKIAlpZiAo
aGNpLT5xdWlya3MgJiBIQ0lfUVVJUktfUkVTUF9CVUZfVEhMRCkKIAkJYW1kX3NldF9yZXNwX2J1
Zl90aGxkKGhjaSk7CiAKLQlyZWdfc2V0KEhDX0NPTlRST0wsIEhDX0NPTlRST0xfQlVTX0VOQUJM
RSk7CisJLyogRW5hYmxlIGJ1cyB3aXRoIEhvdC1Kb2luIGRpc2FibGVkICovCisJcmVnX3NldChI
Q19DT05UUk9MLCBIQ19DT05UUk9MX0JVU19FTkFCTEUgfCBIQ19DT05UUk9MX0hPVF9KT0lOX0NU
UkwpOwogCWRldl9kYmcoJmhjaS0+bWFzdGVyLmRldiwgIkhDX0NPTlRST0wgPSAlI3giLCByZWdf
cmVhZChIQ19DT05UUk9MKSk7CiAKIAlyZXR1cm4gMDsKQEAgLTc2NCw3ICs3NjUsOCBAQCBzdGF0
aWMgaW50IGkzY19oY2lfcnVudGltZV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQogCiAJaGNp
LT5pby0+cmVzdW1lKGhjaSk7CiAKLQlyZWdfc2V0KEhDX0NPTlRST0wsIEhDX0NPTlRST0xfQlVT
X0VOQUJMRSk7CisJLyogRW5hYmxlIGJ1cyB3aXRoIEhvdC1Kb2luIGRpc2FibGVkICovCisJcmVn
X3NldChIQ19DT05UUk9MLCBIQ19DT05UUk9MX0JVU19FTkFCTEUgfCBIQ19DT05UUk9MX0hPVF9K
T0lOX0NUUkwpOwogCiAJcmV0dXJuIDA7CiB9Ci0tIAoyLjUxLjAKCgotLSAKbGludXgtaTNjIG1h
aWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
