Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70AED37E3E
	for <linux-i3c@archiver.kernel.org>; Wed, 14 Jan 2026 15:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pYdqSttBPOow9Qcu9wpvJywNziCrbpafm6BqSNz+RDM=; b=RFqWDqLi9mbPdv
	8eyVxz3nKXx8lp2duT7c62rtVTN2tqaPoOvtuqHs5kqKdFObCcrGpEIV2lUY9dwotsnt1lLQWYe5H
	G6LzcVtc7ZhtlMw4xHb5TqAvvv9Dl8jDfyn9zw8zfSrbkCaFkRgrliamWjm6KcLTHHdc5RHZ+icFx
	1GtWhTxJiH+gzaYXw4qzNBcEisU89TR+qxLUILcGzozZS6DqQnsohyi5OqaTKyFoQ/r/qkDQcS1ba
	SRXwrzi/cCRcjggLauW4IQNM2vu/RDy2aeDr7RBSwFi+49PSRjJo985j3Xuz/yk8BS1HNe6KdvTr+
	yE7X0vXpDxGypvodTGtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg2Ny-00000009bms-3kXX;
	Wed, 14 Jan 2026 15:02:14 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg2Nw-00000009blK-2nsS
	for linux-i3c@lists.infradead.org;
	Wed, 14 Jan 2026 15:02:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 87DD74E420D7;
	Wed, 14 Jan 2026 15:02:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5D5106074A;
	Wed, 14 Jan 2026 15:02:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5CB6610B68265;
	Wed, 14 Jan 2026 16:02:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768402928; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=53MKDbM/lHZYRLYvti2TS9tQU5PkFFr5A5TelP/W6vo=;
	b=ukCtw33Ul5eqOcgcZFnYy+JZ2VO0R6wSsPoBld6e+Q4n/5nhjGNn0XIpdIrzSvK7IMBVRq
	ZtjHLKvOsILoJSlcvLe9q9ShyzznSaglwvBVGV+CB3xmWPZ9pijwbg13+vwAInzKqBEjnz
	IWTofhftjzGa1m93RQcT8xEFvZP56/zb+dV/tNBw7XIf+2E31+ZvGLaQ+Ut0fzLloMDdx/
	TLJreFcsBzEb9Es2kf0McO13znOJfrh1GKm0O5gcjTsQnnf0ME5W86phWgdypK7t7c2Laf
	nkU5N09pdvTs0eS249b+fTTJ65zCYSDmbNw4FyJHkINGavGWxgGPsn3ZG4xiIA==
Date: Wed, 14 Jan 2026 16:02:06 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: jonathan.cameron@huawei.com, Frank Li <Frank.Li@nxp.com>
Cc: andriy.shevchenko@intel.com, carlos.song@nxp.com,
	fluturel.adrian@gmail.com, linux-i3c@lists.infradead.org,
	linux-iio@vger.kernel.org, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/1] i3c: Add stub functions when I3C support is disabled
Message-ID: <176840281753.1259180.16475027635174872850.b4-ty@bootlin.com>
References: <20251230145718.4088694-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251230145718.4088694-1-Frank.Li@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_070212_837411_C1D705F9 
X-CRM114-Status: UNSURE (   7.44  )
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

On Tue, 30 Dec 2025 09:57:18 -0500, Frank Li wrote:
> When I3C is disabled, unused functions are removed by the linker because
> the driver relies on regmap and no I3C devices are registered, so normal
> I3C paths are never called.
> 
> However, some drivers may still call low-level I3C transfer helpers.
> Provide stub implementations to avoid adding conditional ifdefs everywhere.
> 
> [...]

Applied, thanks!

[1/1] i3c: Add stub functions when I3C support is disabled
      https://git.kernel.org/i3c/c/8564f88df202

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
