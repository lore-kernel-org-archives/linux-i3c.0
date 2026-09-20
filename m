Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD885C982DA
	for <linux-i3c@archiver.kernel.org>; Sun, 20 Sep 2026 15:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xp1GSNH1M8LyD5Qn6e/+gzhjrUzca3/3EXuPdVvWjEM=; b=RBZqLu5KHFawxB
	6LlYSoQffx5Ff09nAeaCAuDzYrwWAYvge/wWstAmDWT0OVxr617yWz2iy195JiC9/BnKGfDMP6Sma
	6eALaWKTzU26ayp1QaWygtD9o5HFXcYRok567bgf6ivlZedhHWn7GTpOha1ZwXjaRq8KrAN6emZGf
	qhZgGcO0wBG78gVAREEXpFXuz3vhFtJxJ4DNlza0LX2RYQbYiy3G7Q+B4YtDLpc1uwYGXUHOJSKXf
	V5viLilvW/9skS0F7bkzcjawvaazsDFoFVkVs7ndT6n1ZAhxS+PznjczQWt/nAmT5qfEx9z364weT
	0Bn9MbvZ8wJdCy/VhldA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8JE8-000000002UP-1kIl;
	Sun, 20 Sep 2026 15:13:14 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8JE6-000000002QA-07uW
	for linux-i3c@lists.infradead.org;
	Sun, 20 Sep 2026 15:13:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789917190; x=1821453190;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HqcLNXZXj10D61oVSmkM1nAmz8awVXqF+dcY1IPM0N8=;
  b=ZvJjv+pKLYAwqv3Q8mAVOZwd/BuBnRRKvKi07+RD8ISXPwkKi2SqwNEf
   3VToJEDkc7sjykZsLHMjwB7P0O2r+D9kobxoajFFcGsuVJyN4O6o+YklF
   /T/aA5TbCY/pcQh3sj4anY3Tc9YSIZMd7w2tqOFOYgyda5vQF/u/W9HTi
   InY/mLEyqiRI9Ed/CfApYcADDJrVpC5nFrNSJKMwDbSzz3Q0niHkt2pap
   WeGKnkkMAgXBjbSQcBRqUacumDQIK+a0VMQ0IjWLpeNIAD1EPKu8evOQ3
   wEF6heFWS/QFA0VV3SgESeK7FaRPOHjYV22Vg9IEKNX4yT0KOMsM+Zg1y
   w==;
X-CSE-ConnectionGUID: PNfta8GNTTuwdXvKTg3cJA==
X-CSE-MsgGUID: jB+/GBlzRyGU4J48ekJifA==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="89548431"
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="89548431"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:13:10 -0700
X-CSE-ConnectionGUID: K7hErQ6fRum88BStUx2ezQ==
X-CSE-MsgGUID: q5q4u6K9TPaqeCjFAULdfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="3352388"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.82])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:13:09 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 05/17] i3c: master: Remove stale GETSTATUS length check
Date: Sun, 20 Sep 2026 18:12:35 +0300
Message-ID: <20260920151248.46936-6-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260920151248.46936-1-adrian.hunter@intel.com>
References: <20260920151248.46936-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_081310_082900_0A37BD0D 
X-CRM114-Status: UNSURE (   7.71  )
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	None

Changes in V2:

	Added Frank Li's Reviewed-by tag.


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
