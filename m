Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761F2D148BE
	for <linux-i3c@archiver.kernel.org>; Thu,  8 Jan 2026 08:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ALmd5Y7U9v2t3kJrrQEIR0e4azmD8hKrkwG+YkEpRN4=; b=Yls5btpGO7S5xt
	b1htiALWQ2M2n+zhB9BPBGQiLmFwcn+4OavI+DMs+vMsZKZfaQSbo7By7fHUy/vYOC8JWOhxWgRlU
	gm/YJO2GetWU0WxOr36T49egyNb4fZSSXXhZTDQlPbhBImv8RihSLKIgCpMoz+8hCBmKVX4I5KPIn
	2jfCoClwexLYLjE4RnTEiPhAsnH4/Yg+0b/Cqd/+/P5TjLX7WvVmf8rOFNbidoceNmHNom/qva2pb
	VfgPAjsjChogy/0JRqals9l06gREaO1fFMOoGWNQO/aTX/FrhHSr0lcdG4m6JC+TMM5TZehxeV8Rf
	AvLupTAWjNoEQDU41KBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdl2B-0000000GD4b-2j4d;
	Thu, 08 Jan 2026 08:06:21 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdl29-0000000GCzw-2PWX
	for linux-i3c@lists.infradead.org;
	Thu, 08 Jan 2026 08:06:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767859578; x=1799395578;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WeHv1UoHxq5xmBeE9pI1L8Ip+ew6VUG/WifDZnJ8s1Q=;
  b=PCFTY/JfxCwNZTQcSzhWhX+tSnvAVONSoEQFPPQ1oHobsJouqAZlQtJP
   WCxeJpdlVM9aYXs9TSWQDqzSyRVt5kIFoGpSSJoFgc2iFKbglyasrukOK
   Daih7BWHt4D6YkmmeO8CBkMEmG5LGU3/3N3DJQHUjQZbUQEBtDh65UWgj
   EKDEb8zRJUUk16e2FLTNwn/M+K6ifbpv83I3OX1JAqIJGTgxU35BF5+Vy
   ZDCVJndtWsQdqrKYVtFtjn+nKosNv8GZfY44A+30FoKx5JFnRWY+2oUQT
   GQGeFBwk+dCaVUBHKhBgTGQYZTW5n6hrPgcLr9Zd/d73fb5CABHD8M/OB
   g==;
X-CSE-ConnectionGUID: NqPbzWFQTiGspJ9wPAiTNg==
X-CSE-MsgGUID: OcymQjsxRN6gLEP/dVnkww==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="56792262"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="56792262"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:06:18 -0800
X-CSE-ConnectionGUID: 4PtQ7etbSTKTCmhdwYtqrw==
X-CSE-MsgGUID: 2k/9UBkYRGyTL61mrbSTMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="203413571"
Received: from abityuts-desk.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.195])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:06:15 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 03/20] i3c: master: Update hot-join flag only on success
Date: Thu,  8 Jan 2026 10:05:41 +0200
Message-ID: <20260108080558.21767-4-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260108080558.21767-1-adrian.hunter@intel.com>
References: <20260108080558.21767-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_000617_625670_651D9E45 
X-CRM114-Status: UNSURE (   8.91  )
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

To prevent inconsistent state when an error occurs, ensure the hot-join
flag is updated only when enabling or disabling hot-join succeeds.

Fixes: 317bacf960a48 ("i3c: master: add enable(disable) hot join in sys entry")
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V2:

	Add Fixes tag


 drivers/i3c/master.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 7f606c871648..e6384bffd4ae 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -618,7 +618,8 @@ static int i3c_set_hotjoin(struct i3c_master_controller *master, bool enable)
 	else
 		ret = master->ops->disable_hotjoin(master);
 
-	master->hotjoin = enable;
+	if (!ret)
+		master->hotjoin = enable;
 
 	i3c_bus_normaluse_unlock(&master->bus);
 
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
