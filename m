Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D7AD78787
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Dec 2025 14:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RwHcrI+kjw0NlzdodVtoHICpQqDw7ciAnrG8aN2J6K4=; b=oFMTl0nVo4Fc+5
	NhxR4ciFlF9ArxxWfofHLyTjfP+XpWkN1/Kkzq8uxEzCSts+Wunq6HSk7Bo0CM9+dlfIJQmcZTd9u
	114xcsWnbQMxCrcP4qvoXdztWZ4mnYxiwWjwUb05TN0b8I+6wJjGUzcg/GrePKYugcisaJ2LDl7dE
	V4CbCs+MlNR0Is/EbllO4qaGUQao8zOWQ2w5SKqVSDE+ChmMcqTQl4Y9ta3ZwiYKq7ecIL0lZvrk/
	dFj407w7P7a3aKgpliNgF2WoYfUnYbKanAsw/CK/8l+JR5eqRk84UoRBQyKkQH0haKWR2jYvyFoEB
	AC+Q0BfB9YIOvHqlapzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbk1-0000000ARR6-19vt;
	Fri, 19 Dec 2025 14:46:01 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbjx-0000000ARND-3fap
	for linux-i3c@lists.infradead.org;
	Fri, 19 Dec 2025 14:45:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766155558; x=1797691558;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GOzeEeS7GW9A2VUmB6bw4GgnQX0rS5XXsDpIwETno4E=;
  b=JbPjrAzNQfZhxU/mNMZtIQtIwsHc0VCZpyXsxrD4Qnwv26HzDVdzUL9J
   Q8zibBZjD9b4ZmSIqQkcdZXmg4rDYZRj15C4YMg0y5XUp02wq1Y1i2kjP
   1f5UBex2f2NFSq/3It/nBk0Mv47AegVz8I0rx0rlq9Nj6XemVab2oW84m
   BOe4LAQRvfgSv9EKiY5guYERnEaFTLrNzuxqUtOfqZL9QCtBRVwgBeuBN
   YHrhkuT25/DEDyOUaBguKHATRjQn35odGsOpHhN160sSrMYKsfHkgNvYX
   OYZ6APQzVclyUa/uOyOsa0OqxwY3TrCB5awTRibEAiO9vFcDiVPn8H5nK
   Q==;
X-CSE-ConnectionGUID: 5Yy5whimS2e4Zi9mQaIx6w==
X-CSE-MsgGUID: 7s3FazWeTfW0KHDRaRuV3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="93588929"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="93588929"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 06:45:58 -0800
X-CSE-ConnectionGUID: UTH2WAcoSMGvLkGUg18HrA==
X-CSE-MsgGUID: QBlgMa++TouuksO8WPYHuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="229563953"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.200])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 06:45:55 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH 04/17] i3c: master: Replace WARN_ON() with dev_err() in i3c_dev_free_ibi_locked()
Date: Fri, 19 Dec 2025 16:45:21 +0200
Message-ID: <20251219144534.84391-5-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251219144534.84391-1-adrian.hunter@intel.com>
References: <20251219144534.84391-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_064557_952656_E1EA1BE6 
X-CRM114-Status: UNSURE (   8.23  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

IBI disable failures are not indicative of a software bug, so using
WARN_ON() is not appropriate.  Replace these warnings with dev_err().

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index e6384bffd4ae..ff6cbc044787 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -3113,8 +3113,11 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev)
 	if (!dev->ibi)
 		return;
 
-	if (WARN_ON(dev->ibi->enabled))
-		WARN_ON(i3c_dev_disable_ibi_locked(dev));
+	if (dev->ibi->enabled) {
+		dev_err(&master->dev, "Freeing IBI that is still enabled\n");
+		if (i3c_dev_disable_ibi_locked(dev))
+			dev_err(&master->dev, "Failed to disable IBI before freeing\n");
+	}
 
 	master->ops->free_ibi(dev);
 
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
