Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CFBC64EC4
	for <linux-i3c@archiver.kernel.org>; Fri,  3 Mar 2023 07:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6fgJA/JU12gIn0Ft9vO2C9XF4+TEb1FTeF3WEBv7C2Y=; b=dxnz9jZkJmVrNO
	DqSlmFFbY2G9w1kn0nWUrMPp1OjD3nH+1MS6RkM85zOSfzqwLmVi5RttiJGMOZT7KtBfmKacVUwYv
	QkT92ignww3SKNX+J1KKfjDAKUDcuh2UuNpj6TaxrqKwfR1bEPNGPKT9LEnqeSGPWLnVlgdbpUoHV
	NDJqEEFXh8ym/LQJLluvxAaeRAxk3EM5wSukjWmljLm9NfcvGtJCgkZNFUoTX7vmecskgy/DMhkKA
	+d7DxvkJVhXqRZ2vEpeTD5xLqsP8HYvs7BuJyY/SosHvMmRfr2CKG0MpOd8JwBeK9qgLs1yMuT5+p
	LHuCFvS/chBilCD2l90w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXzam-005CXK-2s; Fri, 03 Mar 2023 07:12:36 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXldW-002ncB-Qe
	for linux-i3c@lists.infradead.org; Thu, 02 Mar 2023 16:18:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677773910; x=1709309910;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cc/SCprntliIKJSK+Q8o0WMOD/lb0OEWb6pXJBqR1zY=;
  b=joGFc1ANHVNdgvkOtKxdkbXXO+IUzPIRJ1whRolitx7I2lewjIAfYvLl
   Em8FfbrPsilq+gLpnvE46UnpaciyGFcgN4/j3Xt1DqQ/eU09fJR4rlvAi
   vnVLIovKO7oV1H2gYz0oP06d2bhTc+eENhA3UzBcpIg+rJYPrSewfvueU
   aQ0hrEPBmZxurnEFA9BeZhpANHyuxlsgxSjiWxTPRMqdQJgMuwzmHgiyZ
   eidhbnz1YNYKFzuYYZfAUxBweK+ZzEpf75jq70jMEu2Nv8ldNO/X9FL6N
   cgPMlaJgeQJF8h2HnqrERj1gqcgO9jsJZxaXoUS3/0Kyn8H5oanRd7ZqU
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="397351504"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; 
   d="scan'208";a="397351504"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 08:11:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="739137798"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; 
   d="scan'208";a="739137798"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 02 Mar 2023 08:11:26 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id D8387143; Thu,  2 Mar 2023 18:12:08 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v1 1/1] =?UTF-8?q?i3c:=20Correct=20reference=20to=20the=20?= =?UTF-8?q?I=C2=B2C=20device=20data=20type?=
Date: Thu,  2 Mar 2023 18:12:06 +0200
Message-Id: <20230302161206.38106-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_081830_943500_B6440484 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Thu, 02 Mar 2023 23:12:34 -0800
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

ScKyQyBwZXJpcGhlcmFsIGRldmljZXMgdGhhdCBhcmUgY29ubmVjdGVkIHRvIHRoZSBjb250cm9s
bGVyIGFyZQpyZXByZXNlbnRlZCBpbiB0aGUgTGludXgga2VybmVsIGFzIG9iamVjdHMgb2YgdGhl
IHN0cnVjdCBpMmNfY2xpZW50LgpGaXggdGhpcyBpbiB0aGUgaGVhZGVyIGZpbGUuCgpTaWduZWQt
b2ZmLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNv
bT4KLS0tCiBpbmNsdWRlL2xpbnV4L2kzYy9tYXN0ZXIuaCB8IDMgKystCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9s
aW51eC9pM2MvbWFzdGVyLmggYi9pbmNsdWRlL2xpbnV4L2kzYy9tYXN0ZXIuaAppbmRleCA2MDRh
MTI2Yjc4YzguLmExMmNkYTlkYzcxNSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9pM2MvbWFz
dGVyLmgKKysrIGIvaW5jbHVkZS9saW51eC9pM2MvbWFzdGVyLmgKQEAgLTIyLDkgKzIyLDEwIEBA
CiAjZGVmaW5lIEkzQ19CUk9BRENBU1RfQUREUgkJMHg3ZQogI2RlZmluZSBJM0NfTUFYX0FERFIJ
CQlHRU5NQVNLKDYsIDApCiAKK3N0cnVjdCBpMmNfY2xpZW50OworCiBzdHJ1Y3QgaTNjX21hc3Rl
cl9jb250cm9sbGVyOwogc3RydWN0IGkzY19idXM7Ci1zdHJ1Y3QgaTJjX2RldmljZTsKIHN0cnVj
dCBpM2NfZGV2aWNlOwogCiAvKioKLS0gCjIuMzkuMQoKCi0tIApsaW51eC1pM2MgbWFpbGluZyBs
aXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
