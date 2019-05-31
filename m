Return-Path: <SRS0=j58l=T7=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFAC1C04AB6
	for <linux-i3c@archiver.kernel.org>; Fri, 31 May 2019 17:35:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9588726D45
	for <linux-i3c@archiver.kernel.org>; Fri, 31 May 2019 17:35:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bmSRne7+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9588726D45
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QO6pYzITv2yNQSAMlVgKRODjw3WcxPhbq8OcA53edBI=; b=bmSRne7+nOCqHM
	bzJm2TCkAGYYdxEzWNz71ge7FOHnaWDVAKa9ZGG9oV701OBM1K3IHjNRC8GLQpjlZ2MGAcYQtjG1H
	8ZH4TZ/0NmX+3yfbCengJ+SEhQTVTjTNcmfy3uMfuvhWXEpv9ZddmRI2Zc4jCJjGyYYLkRayFYlFT
	1MC2FG2I2jHSIzYd4iyfD3PhwS6hM4I5PFzQWLhgw5dT55W0vSQ36tDSQlp5rSYdPePSrUBMVfjz8
	+HNeuN+FdIPNp1OKZ95HN3f4aUcWty+ccCRkuOoiXl80g0WmXFlf4HQm1b7ekLD0N1xr2a0eQ5UkI
	YDabAufFkO7dlqABXfVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hWlRX-0005J9-88; Fri, 31 May 2019 17:35:51 +0000
Received: from gateway30.websitewelcome.com ([192.185.197.25])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hWlRT-0005Hr-RY
 for linux-i3c@lists.infradead.org; Fri, 31 May 2019 17:35:49 +0000
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
 by gateway30.websitewelcome.com (Postfix) with ESMTP id 832F87825
 for <linux-i3c@lists.infradead.org>; Fri, 31 May 2019 12:35:35 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id WlRHh5HjCdnCeWlRHhjeid; Fri, 31 May 2019 12:35:35 -0500
X-Authority-Reason: nr=8
Received: from [189.250.123.250] (port=48162 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.91)
 (envelope-from <gustavo@embeddedor.com>)
 id 1hWlRF-002R8Y-Qw; Fri, 31 May 2019 12:35:33 -0500
Date: Fri, 31 May 2019 12:35:32 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: [PATCH] i3c: master: Use struct_size() helper
Message-ID: <20190531173532.GA7141@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.250.123.250
X-Source-L: No
X-Exim-ID: 1hWlRF-002R8Y-Qw
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [189.250.123.250]:48162
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 2
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190531_103547_932869_4920B2E7 
X-CRM114-Status: UNSURE (   5.90  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Make use of the struct_size() helper instead of an open-coded version
in order to avoid any potential type mistakes, in particular in the
context in which this code is being used.

So, replace the following form:

sizeof(*defslvs) + ((ndevs - 1) * sizeof(struct i3c_ccc_dev_desc))

with:

struct_size(defslvs, slaves, ndevs - 1)

This code was detected with the help of Coccinelle.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/i3c/master.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index b9d2b88928e1..923b04052038 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -924,9 +924,8 @@ int i3c_master_defslvs_locked(struct i3c_master_controller *master)
 		ndevs++;
 
 	defslvs = i3c_ccc_cmd_dest_init(&dest, I3C_BROADCAST_ADDR,
-					sizeof(*defslvs) +
-					((ndevs - 1) *
-					 sizeof(struct i3c_ccc_dev_desc)));
+					struct_size(defslvs, slaves,
+					ndevs - 1));
 	if (!defslvs)
 		return -ENOMEM;
 
-- 
2.21.0


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
