Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B00C88E70
	for <linux-i3c@archiver.kernel.org>; Mon, 14 Sep 2026 11:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QE8SE2g1VJIhFAvBoU5siU4UkUZjALuuFAWsxnb6rZY=; b=wr/cnCuRB3cM36
	le+ffddk9IQhlF57p6ZE1u+h6i+4v3EHrIvgPZCKFUH4Hza7tjqDyvxwA4UQ9/W8BKpvWprQUmONR
	Y8R4uwMBCbmxQbIZJRskf8Vwi7WJckBE7SNteZEWkYqDzPnJHfdznmK1A0KV5bX1hx1BzTweq0UAS
	DfiaLTBtk4lsfMTsJd6sNSLuoSkJDgbsJYGH/mQkyyNjXMntM+qwfAEARkD4D8+EM+gBLMkDdlpJO
	wynkBuB0OfIvtWKzevwv1tels28VSbrTSnZiDdpwCo7mspryfkYyNGdgvc6tgrO5qBTeS3gmgq3qu
	nAS2DdtAu1o9VatKS36w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64tQ-00000003FA6-1fcf;
	Mon, 14 Sep 2026 11:30:36 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64tG-00000003F69-1ass
	for linux-i3c@lists.infradead.org;
	Mon, 14 Sep 2026 11:30:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789385426; x=1820921426;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mEuXU+hSGHRuOZy7jlByqS/F3cXwBBH8RTpFfujh51M=;
  b=l2kBFCEH4LcfzzhIj0kBdrRiS7qZpMD+L03pbr8BmXpyNRbjqdIpxPV0
   mhTUSo3VAUUbaMezfGH/YBDWEcMChYpbb4IotGnejHgNnFz+nLwU2NRW8
   13UeNqfNIMAPrTdRK+sJddSAV3ZQjw5djCapvzTwLQ/X4eQh7h8bDhzn5
   WzSgut2eSDrTYXpg9q81V9gNrnbAa7hzg1zqenYOs+3/eWq5LG2Uyn1EH
   90oytxlP2gosUG5cYfCZ6cTPKXbOV3jwTJdaIEIrXlA/axgYlSHC/9mZ1
   hJC3OS+RzAb1hVViAMZSPZQGMA0Jc39m4Cr5ptuiZlJUy91HKPM1dcLRK
   Q==;
X-CSE-ConnectionGUID: UNjcPDrzQcaSFM64XXFL3Q==
X-CSE-MsgGUID: VrZFKccWTWadPxW2NQH+0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89864432"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="89864432"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:30:26 -0700
X-CSE-ConnectionGUID: V1ASewLsSPCC6+39RmdhwA==
X-CSE-MsgGUID: 3X4WaPLfQdSqRWrAgM+LMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="273133101"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.35])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:30:25 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/17] i3c: master: Remove stale GETSTATUS length check
Date: Mon, 14 Sep 2026 14:29:51 +0300
Message-ID: <20260914113003.183150-6-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914113003.183150-1-adrian.hunter@intel.com>
References: <20260914113003.183150-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_043026_431552_EB0AA67E 
X-CRM114-Status: UNSURE (   8.19  )
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

i3c_master_getstatus_locked() verifies dest.payload.len against
sizeof(*getstatus) after issuing a GETSTATUS CCC.

This check predates the introduction of dest.payload.actual_len. Since
then, dest.payload.len has held the requested transfer length and
dest.payload.actual_len has held the received length, so the check is
always false and can never detect a short response.

It also predates the addition of generic read CCC response length
validation in i3c_master_send_ccc_cmd_locked(), which now performs the
necessary check before returning success.

Remove the stale check.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 215a22f2c7b6..4296c51a9537 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1777,11 +1777,6 @@ static int i3c_master_getstatus_locked(struct i3c_master_controller *master,
 	if (ret)
 		goto out;
 
-	if (dest.payload.len != sizeof(*getstatus)) {
-		ret = -EIO;
-		goto out;
-	}
-
 	if (status)
 		*status = be16_to_cpu(getstatus->status);
 out:
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
