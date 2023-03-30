Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13DC4C761AF
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Mar 2023 07:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S77/XvJLJo0ToGngp0ejDDIWApRH1dk71tmtG1BvW2g=; b=49dEADSaa+1IoI
	goFXCCk8nmk43dggBNuZjcdRHmItseowBbeqmjvaN23KuO7ANqnYbagK8KBiftnY6YDIbIF8DUrke
	Q+lOYPy59rQrLGRDMjy0Xo28RJgVzwnLzCFBBZZi0zbOrAYX5pEHub4/g309eVvPJFKfOB21Thcue
	rhCXhW0UepyKVLRe85yQZ6Kkf6yWrvvJ8Eo8rAF5frieHYgSdxRIrkGDOso9/mcxQyR7/yDoM3jE+
	U8JGtoQF8zp6wtgikxS9AG0zCCPxqR8Ro4V42ePNfa3ltH+bJGN4PKrohSOyE/uWt8lzVq7JGA7Yp
	VCtnbiok2UDI+Mcckmiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phmOW-002rGQ-1P;
	Thu, 30 Mar 2023 07:08:24 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phlZi-002jPW-3C
	for linux-i3c@lists.infradead.org;
	Thu, 30 Mar 2023 06:15:56 +0000
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id D8F5D200DB; Thu, 30 Mar 2023 14:15:39 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1680156939;
	bh=04Y+8KxLXMPtqZBls6JDe+6CDMaXazUKLqpLOfY+rR8=;
	h=From:To:Cc:Subject:Date;
	b=dL4ewjI3rVtOjeAmP61Edc9EoZFCL2dsEbolf92tulfpXNUaIF4QbAjjOtICbmO9k
	 yh07sCHsYZNNvXmfzOLJf4WRKsNWD2KZAEga5qZO1ZuBrL9SKQGDTAnq2/14d51fqq
	 Hv7vapQA1In7KnMhFtOMmvWFMcCP0qvxB6UCYBRl7I3DefuzVDViIyBxdXeqYM4NpM
	 AgxdLsFE5iGuMrzaqeJXDRQbzi0trQ/ZksxoHzDC5gJfd9AlZonW6xowgkK3UGmMzM
	 uPX9bcm7gysSUKSav1elPitWTIpFNMd5M4G/pdwt5QBJIjVeBF/Foc3SodTpMqfNuz
	 Qy9D39uLY1eug==
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: linux-i3c@lists.infradead.org
Cc: Matt Johnston <matt@codeconstruct.com.au>,
	Vitor Soares <ivitro@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jack Chen <zenghuchen@google.com>
Subject: [PATCH 0/2] i3c: dw: minor changes
Date: Thu, 30 Mar 2023 14:15:31 +0800
Message-Id: <cover.1680156630.git.jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_231555_409384_3E86DDB9 
X-CRM114-Status: UNSURE (   5.42  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Thu, 30 Mar 2023 00:08:23 -0700
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

This series contains a minor fix for the dw driver, and a small cleanup
+ comment.

Jeremy Kerr (1):
  i3c: dw: use bus mode rather than device reg for conditional tCAS
    setting

Matt Johnston (1):
  i3c: dw: Return the length from a read priv_xfer

 drivers/i3c/master/dw-i3c-master.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

-- 
2.39.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
