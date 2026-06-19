Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F3ECD98F6
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Jun 2026 03:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lUbRrSsjOAQvzWSk5AA14yNrRuMrX03uLsU++8o//h4=; b=GCd2/BUhjODn8k
	OAY9v9/uDMJDWy/vYTfHDRvhXiNW8MHQPUwqqIk2LpO91gqX/8dItNQe5U3zqB817sRDTzMnneJaP
	01E9GHXDL0VNgpuhAQBD1LHDNoVJum3QjU0LfM05Q5Xsaa8tPdcgJ68KnB1G65nazdCx+NRl1MnFw
	OTo/tupgP6uNtArgQ8PSh2jBHGxnz5RfNejwaMM/AzgNy5mo3uGM8TTokeIziSyrzG0UnaUgzi2t3
	0PH4/EDhLEV8OLGRNDKIHZm9BFQx1w6UuYjzSlEHaXbKiP5RR1EZn5FmGs3o1QfGen6PqXtSVgFgt
	xpx8p8KJ1PbkDizrrnFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waPeV-00000001x8t-07WY;
	Fri, 19 Jun 2026 03:12:19 +0000
Received: from mail-m1087.netease.com ([154.81.10.87])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waPeQ-00000001x8U-3wmL
	for linux-i3c@lists.infradead.org;
	Fri, 19 Jun 2026 03:12:17 +0000
Received: from PC-202605011814.localdomain (unknown [222.191.246.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 42fc1afa6;
	Fri, 19 Jun 2026 11:12:08 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank Li <Frank.Li@kernel.org>,
	Jorge Marques <jorge.marques@analog.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn,
	runyu.xiao@seu.edu.cn
Subject: Re: [PATCH] i3c: master: adi: initialize the lock before enabling interrupts
Date: Fri, 19 Jun 2026 11:12:02 +0800
Message-Id: <20260619031202.1813952-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ajMGfHq6f-sEOft7@lizhi-Precision-Tower-5810>
References: <ajMGfHq6f-sEOft7@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
X-HM-Tid: 0a9edddd4c0903a1kunma769ddbfbbd1e
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGE1NVkIaGRhPT0oYGk5CHVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUlVSkJKVUlPTVVJT0lZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pPSExVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=U9Kvhs0Wum1MXbf9jujjI8Glf9YmGF3Pa4VOlqaSwoJ1iTEXC5BhSIgMr+kUyuljC4K+pPzqJclTHtF9ykuyE3HK1qVb5brFeXGALhO+s3BAknERmMRzPdBfgggg0ws3bhLUGAduidx9I4NGOMQMlQzgg5YT+GGfG7gmsCogrI4=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=GRJzTwIEo2YxX4ZtopDsoR5hwdurThpMsuCP9sq4AbQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_201215_609898_C63A7738 
X-CRM114-Status: UNSURE (   2.86  )
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

Hi Frank,

Thanks for the review.

On the DAA address assignment issue: yes, I will look into it as a
separate follow-up patch.  I will keep it independent from this IRQ/lock
initialization fix so the current patch stays focused.

Thanks,
Runyu

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
