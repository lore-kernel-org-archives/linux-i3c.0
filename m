Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A73D73E85
	for <linux-i3c@archiver.kernel.org>; Thu, 29 Jan 2026 18:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/xeHLyrW70Wgo6+8AZkVmhWpDU7ICjouvfXEeUK0SFk=; b=wTIUt9uCjRDmmQ
	IGALvpI6gDXURgaex9YPDP+2BWY5lL37x5HoTMOqExWOFX7eHaKbdjhKLEaVE/YbRFdi7oIDbnJlD
	czw+PXhyyuCSCEtxNEFqFQkZu4Wqq69q5NgF1snnS++xwX1fi3kyXlLf5Nzjzn9sB0e7df2zxIate
	6rNXWqfRTokLli+fHj753Lu3Fx1SanHKyH5Qln9325P8lpJpSWVsTOt+7IFV0nRsoYqUiZwLm4aQj
	d90kNNqddUccGWjB5uZF8dLgYUvJhSAFyILXEc3d4w5Wjo3wKmxWEpvAS8c3/E6zxdW62+GCiuavb
	B+JoPNRJJkQEvlDRecfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlWbf-00000000VVf-2Pb1;
	Thu, 29 Jan 2026 18:19:03 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlWbd-00000000VQW-0ual
	for linux-i3c@lists.infradead.org;
	Thu, 29 Jan 2026 18:19:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769710741; x=1801246741;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D+WHOGKFshiFkAf45pAICzZWD+m0dKpyCxa51cP0wQQ=;
  b=aPqCLxVV61ETKAaFpYqeApOUoVK+WFA7GeBqur7UQo0vXMVkkUw3sJjI
   RscCeyBnFzrc3kbEigsaeQ3hNGMhZeRJEL6uAQm8uzor5fKrVWmrfMODz
   hmyPflB7oNtzrEm99E4/Ql/IUuOnuTwSwDpTmmnMHJn/xhUcDfWHq0+v5
   /f1Ib0HohUCucdxbq+FLO2XNlKMRumKbJdNIeEgzNa54CKMWOIiN+gev0
   EvfotCf8+7ArkgYrOtW85TQAAJlumTDoLwDQmP1a+T236ye79EZzDrfR0
   396gIoMuzUQZygGOEhXq/w8RO+HM0HDe0L56BcJw+NQWGxgJuPLBlhv8V
   A==;
X-CSE-ConnectionGUID: asIshlJ4TfaK+yfrOTt4Mg==
X-CSE-MsgGUID: AGxxAZZMTyyr4Nv1ZlOt4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70158286"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="70158286"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 10:19:01 -0800
X-CSE-ConnectionGUID: EvvHSjuSTnK+KcRcB9zE4g==
X-CSE-MsgGUID: r5UZsRcyT7KSWmAKjVuHtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="208255292"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.96])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 10:18:59 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 3/7] i3c: master: Mark last_busy on IBI when runtime PM is allowed
Date: Thu, 29 Jan 2026 20:18:37 +0200
Message-ID: <20260129181841.130864-4-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260129181841.130864-1-adrian.hunter@intel.com>
References: <20260129181841.130864-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_101901_267366_2084CB04 
X-CRM114-Status: GOOD (  11.11  )
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

V2hlbiBhbiBJQkkgY2FuIGJlIHJlY2VpdmVkIGFmdGVyIHRoZSBjb250cm9sbGVyIGlzCnBtX3J1
bnRpbWVfcHV0X2F1dG9zdXNwZW5kKCknZWQsIHRoZSBpbnRlcnJ1cHQgbWF5IG9jY3VyIGp1c3Qg
YmVmb3JlIHRoZQpkZXZpY2UgaXMgYXV0b+KAkXN1c3BlbmRlZC4gIEluIHN1Y2ggY2FzZXMsIHRo
ZSBydW50aW1lIFBNIGNvcmUgbWF5IG5vdCBzZWUKYW55IHJlY2VudCBhY3Rpdml0eSBhbmQgbWF5
IHN1c3BlbmQgdGhlIGRldmljZSBlYXJsaWVyIHRoYW4gaW50ZW5kZWQuCgpNYXJrIHRoZSBjb250
cm9sbGVyIGFzIGxhc3QgYnVzeSB3aGVuZXZlciBhbiBJQkkgaXMgcXVldWVkICh3aGVuCnJwbV9p
YmlfYWxsb3dlZCBpcyBzZXQpIHNvIHRoYXQgdGhlIGF1dG8tc3VzcGVuZCBkZWxheSBjb3JyZWN0
bHkgcmVmbGVjdHMKcmVjZW50IGJ1cyBhY3Rpdml0eSBhbmQgYXZvaWRzIHByZW1hdHVyZSBzdXNw
ZW5zaW9uLgoKU2lnbmVkLW9mZi1ieTogQWRyaWFuIEh1bnRlciA8YWRyaWFuLmh1bnRlckBpbnRl
bC5jb20+Ci0tLQogZHJpdmVycy9pM2MvbWFzdGVyLmMgfCA1ICsrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyLmMgYi9k
cml2ZXJzL2kzYy9tYXN0ZXIuYwppbmRleCBiY2M0OTNkYzlkMDQuLmRjYzA3ZWJjNTBhMiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyLmMKKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyLmMK
QEAgLTI3MjEsOSArMjcyMSwxNCBAQCBzdGF0aWMgdm9pZCBpM2NfbWFzdGVyX3VucmVnaXN0ZXJf
aTNjX2RldnMoc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAqbWFzdGVyKQogICovCiB2b2lk
IGkzY19tYXN0ZXJfcXVldWVfaWJpKHN0cnVjdCBpM2NfZGV2X2Rlc2MgKmRldiwgc3RydWN0IGkz
Y19pYmlfc2xvdCAqc2xvdCkKIHsKKwlzdHJ1Y3QgaTNjX21hc3Rlcl9jb250cm9sbGVyICptYXN0
ZXIgPSBpM2NfZGV2X2dldF9tYXN0ZXIoZGV2KTsKKwogCWlmICghZGV2LT5pYmkgfHwgIXNsb3Qp
CiAJCXJldHVybjsKIAorCWlmIChtYXN0ZXItPnJwbV9pYmlfYWxsb3dlZCkKKwkJcG1fcnVudGlt
ZV9tYXJrX2xhc3RfYnVzeShtYXN0ZXItPnJwbV9kZXYpOworCiAJYXRvbWljX2luYygmZGV2LT5p
YmktPnBlbmRpbmdfaWJpcyk7CiAJcXVldWVfd29yayhkZXYtPmliaS0+d3EsICZzbG90LT53b3Jr
KTsKIH0KLS0gCjIuNTEuMAoKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtaTNjCg==
