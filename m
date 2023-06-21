Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 471EBEB64DC
	for <linux-i3c@archiver.kernel.org>; Thu, 29 Jun 2023 10:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7CfTUlR3fXPVY9/Rz7HfZd+WmycNc8/UQCQgo0qfLww=; b=JXS4c8zi4BK/Ar
	wTlOWoqWke0dfJipuNyBnwcHyLcZaAw7GezhuQQ8yQKkuUNPa4ALVZJmlvBNtrVMCbx2TdUGWprNQ
	JCfBfIiH0mCBjCHlmKi0rk6jhd0MZ2otS0n1ITJoEXO6fFZrvSs1oiT/n88jDedO2deJXkrWvNNYs
	0u+vopJAvWHsTvPCOklQF/9f2S3pLs0mPnlfBWR5PMh4epk31ZfrCegQ6GDCru07rMyyLvpbryrjz
	bNtY6uRJEHHd/1vHsWZnucOf4GTjJfIxM0C1yHI40bvPlY2D5g4WatlA2mPlmplikkrQhR/AR9JbK
	ybJBPkkHNlyXAkf9g1BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEohq-000fp8-1R;
	Thu, 29 Jun 2023 10:16:54 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qC0Z3-00F45v-1S
	for linux-i3c@lists.infradead.org;
	Wed, 21 Jun 2023 16:20:14 +0000
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1qC0Yw-00CSap-Fg; Wed, 21 Jun 2023 17:20:07 +0100
Received: from ben by rainbowdash with local (Exim 4.96)
	(envelope-from <ben@rainbowdash>)
	id 1qC0Yx-001z4X-0O;
	Wed, 21 Jun 2023 17:20:07 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	alexandre.belloni@bootlin.com
Cc: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [RFC 2/5] i3c: add error print to show device failing during populate bus
Date: Wed, 21 Jun 2023 17:20:02 +0100
Message-Id: <20230621162005.473049-3-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230621162005.473049-1-ben.dooks@codethink.co.uk>
References: <20230621162005.473049-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_092013_491353_F8019C2F 
X-CRM114-Status: GOOD (  10.35  )
X-Mailman-Approved-At: Thu, 29 Jun 2023 03:16:50 -0700
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

The of_populate_i3c_bus() does not produce much helpful output when
a device fails to add, so addd an explicit dev_err() showing the
device node that failed and the error code it failed with. This should
make finding bad device-tree entries easier.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/i3c/master.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 559fc2781a81..6316f3fc914a 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2125,6 +2125,8 @@ static int of_populate_i3c_bus(struct i3c_master_controller *master)
 	for_each_available_child_of_node(i3cbus_np, node) {
 		ret = of_i3c_master_add_dev(master, node);
 		if (ret) {
+			dev_err(dev, "%pOF: failed to add device (%d)\n",
+				node, ret);
 			of_node_put(node);
 			return ret;
 		}
-- 
2.40.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
