Return-Path: <SRS0=M/mW=E7=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAAE0C63777
	for <linux-i3c@archiver.kernel.org>; Wed, 25 Nov 2020 09:57:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50C022083E
	for <linux-i3c@archiver.kernel.org>; Wed, 25 Nov 2020 09:57:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ThZYlYz1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="WRL8r0R3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50C022083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HUmt1TfGf8/TK6FgcRlDU3c6ai9RPnudfxrCD6y+BzI=; b=ThZYlYz1psBJaTALsXdjeLNWj
	35rUB6S4D9DlvfVJi9mR1WQStECy4uhppv6KiBq0o1neBW3p4IE8KXGmSYOpSRymeO6MB1jKBbOzl
	BDL3z+oqoF/t7uiGcEvuOjRrnZrQP7tjXUmXF33IUPRsikVcjHf6CQl4B2KuZoyG9C97xrzclWUxw
	HltC6KdRh1OlnMit7nmP3WydgsJ4vekwcGCbPNwNCRExxGKxiHg1e7xzgeA9Mp7KRmtN0qcrN7LTa
	ZYKGpcuXdCYRdApIbsuciBLQgn95wV4kRvqajWB4cxDSdI3Xp8Bz25TvYRRxx/WgQeaOHQ4zOgdJy
	sQH1V70Mg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khrXr-0006OX-Cb; Wed, 25 Nov 2020 09:57:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgBGU-0002gN-4f
 for linux-i3c@lists.infradead.org; Fri, 20 Nov 2020 18:36:10 +0000
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7181824178;
 Fri, 20 Nov 2020 18:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605897369;
 bh=/KDY4J07mjjm5lcTX58j7+USUutizIZZ0ViN5Kxbmkk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WRL8r0R3Mdb47Vlf9I97aZMr5QO3SEebP18pjNtVd1HBd8nsl8CFBXiVYGkOXyDCf
 QWF23eaSG5b14+hgQXX+ZLhRkgoYmEHRK1mYTGOfJbwnLvENaNhv7OgBFSEjWPrHVa
 HWIqelj7mIqnlJqunk8qT5tlf9VaffVauMDbki/g=
Date: Fri, 20 Nov 2020 12:36:14 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: =?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Subject: [PATCH 088/141] i3c: master: cdns: Fix fall-through warnings for Clang
Message-ID: <84750a7bd4a70dbebd6662c5d5bf132b2a215d06.1605896060.git.gustavoars@kernel.org>
References: <cover.1605896059.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1605896059.git.gustavoars@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_133610_281883_CBAB7BC9 
X-CRM114-Status: GOOD (  12.31  )
X-Mailman-Approved-At: Wed, 25 Nov 2020 04:56:58 -0500
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
by explicitly adding a break statement instead of letting the code fall
through to the next case.

Link: https://github.com/KSPP/linux/issues/115
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/i3c/master/i3c-master-cdns.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index 3f2226928fe0..5b37ffe5ad5b 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -1379,6 +1379,8 @@ static void cnds_i3c_master_demux_ibis(struct cdns_i3c_master *master)
 
 		case IBIR_TYPE_MR:
 			WARN_ON(IBIR_XFER_BYTES(ibir) || (ibir & IBIR_ERROR));
+			break;
+
 		default:
 			break;
 		}
-- 
2.27.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
