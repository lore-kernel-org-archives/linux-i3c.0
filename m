Return-Path: <SRS0=dvbH=2I=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4E33C43603
	for <linux-i3c@archiver.kernel.org>; Wed, 18 Dec 2019 08:25:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A751820717
	for <linux-i3c@archiver.kernel.org>; Wed, 18 Dec 2019 08:25:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IqIQPD5B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A751820717
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b82xNdKSLYEFroleRHr6cMP+bSIXoa8+0FwCop7LVH8=; b=IqIQPD5BhbHpu5
	dZ6VylZKQVBG+Y44F91TY2DpwaP3aaomI5JKxlle+bkeUAgvjskhwKNMEetwY1v4yDQ/Irwdh8Gpu
	tG5IOQQHaSsoJ7oFUBI/9IEWbeZcg7j+r6yzdHDSjlavypI5IN5XCi5QxPkaWOb0J49EvcQmlECVx
	BruRjNqvuYt4HslcYuPEGwERLy7j2iPmIAaNOfgowUp1LCHszSZu9yUdj0w/UCEuDOpg0PiclvX6i
	lfvym28bxhiIfj9XkdD4SKU7l0ZszU8Isl+Im1zsHvIKbM5Mn28dbP009J63ywn8BVW8Aj1deHcvI
	iDCkS87Xi04S/4mdA6fQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihUdi-0005Rg-Hk; Wed, 18 Dec 2019 08:25:02 +0000
Received: from imap2.colo.codethink.co.uk ([78.40.148.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihBgw-0007mA-Er
 for linux-i3c@lists.infradead.org; Tue, 17 Dec 2019 12:11:07 +0000
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1ihBgt-00062E-Iw; Tue, 17 Dec 2019 12:11:03 +0000
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.3)
 (envelope-from <ben@rainbowdash.codethink.co.uk>)
 id 1ihBgt-008xPS-Aj; Tue, 17 Dec 2019 12:11:03 +0000
From: "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
To: ben.dooks@codethink.co.uk
Subject: [PATCH] i3c: make 'i3c_bus_set_mode' static
Date: Tue, 17 Dec 2019 12:01:50 +0000
Message-Id: <20191217120150.2134326-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191217_041106_496064_7B8BCACA 
X-CRM114-Status: UNSURE (   9.16  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Wed, 18 Dec 2019 00:25:01 -0800
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
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
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

The function i3c_bus_set_mode() is not declared or
exported, so make it static to avoid the following
warning:

drivers/i3c/master.c:530:5: warning: symbol 'i3c_bus_set_mode' was not declared. Should it be static?

If it is needed in the future, then it should be declared
and suitably exported.

Signed-off-by: Ben Dooks (Codethink) <ben.dooks@codethink.co.uk>
---
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/i3c/master.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 043691656245..7f8f896fa0c3 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -527,8 +527,8 @@ static const struct device_type i3c_masterdev_type = {
 	.groups	= i3c_masterdev_groups,
 };
 
-int i3c_bus_set_mode(struct i3c_bus *i3cbus, enum i3c_bus_mode mode,
-		     unsigned long max_i2c_scl_rate)
+static int i3c_bus_set_mode(struct i3c_bus *i3cbus, enum i3c_bus_mode mode,
+			    unsigned long max_i2c_scl_rate)
 {
 	struct i3c_master_controller *master = i3c_bus_to_i3c_master(i3cbus);
 
-- 
2.24.0


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
