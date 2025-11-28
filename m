Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F70D116EA
	for <linux-i3c@archiver.kernel.org>; Fri, 28 Nov 2025 23:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NU1Oy1RoU3AXXmcqbcxMaVIOp/R3JR3mVFyMi4ffzTo=; b=WqWqYmS5ApipQn
	lCRNlFqF1DXzO3y+nnZe0njsLocDh0lwsv9SmjI8q66BMelf3N/dGSaAQxLsrNaYRDl8E8ANjt4J5
	lUI1Pac/++XlLG5uGv/aOQ4JDDrF+0YDG5nF822nqRkjIi77uJvpsZ36pSjTR1G9Dkj5sZ4S1+6f9
	NuHxEFc01iAXXnjLg4AgtYaVQKB6A41phNErWkxMSLTe/rfh5CEKfBRuiLQrciK+6U6i688p7syH3
	K1dce1K0ijPp6Lzysd7gm6YLcckTtfql0+f4Z1Q6gW2N+wQ5PnlE6SooX3ff8mIgJkgfGGgCRgpRz
	Rg51uCAs0SRo3tR8nlsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP7xa-000000013Q3-1lfI;
	Fri, 28 Nov 2025 23:33:06 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP7xW-000000013Pc-3V4W
	for linux-i3c@lists.infradead.org;
	Fri, 28 Nov 2025 23:33:04 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2BBE1C15D6B;
	Fri, 28 Nov 2025 23:32:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EEBFD60706;
	Fri, 28 Nov 2025 23:32:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2328B10B02605;
	Sat, 29 Nov 2025 00:32:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764372779; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=nrQIrhb9ptS2yZiTYqRpOC07Bin7QfwRXZbB/yCEBEo=;
	b=h9ECBGoYOwczR8o2kvxMcysDKoQLnnFPn74mUCE5fSI7tOqreWqu1g4DdcdMpUmP3BIsZr
	ls8zlqGkDun6VJvSO+CP0KQDer+QUXPRNQb7/8V3HDFmxUlHS4uChMEZ/PVIh6kQ4woLTp
	cU4iliX/fvI+tA+TkMulNs4/OzViDBbEFcrmPcm7YRvAr13C5842cVbWfOTXl7AP8d12Pj
	nNJ4HZWGPamZ+5DrIprYd9yKeGpL99GVP/d1JRLhak25I+TBHBSe1x6A4HVCXr5eDY6b9y
	viY/O82R9DpU3/jCyh5nXKMczqct+CEqddq10L8Hc4CLUfkjWiL89ud2YF7wFw==
Date: Sat, 29 Nov 2025 00:32:57 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	Marco Crivellari <marco.crivellari@suse.com>
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Michal Hocko <mhocko@suse.com>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH] i3c: master: add WQ_PERCPU to alloc_workqueue users
Message-ID: <176437267658.886424.4325635802365787848.b4-ty@bootlin.com>
References: <20251107132949.184944-1-marco.crivellari@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251107132949.184944-1-marco.crivellari@suse.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_153303_061047_2349CA43 
X-CRM114-Status: UNSURE (   8.51  )
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

On Fri, 07 Nov 2025 14:29:49 +0100, Marco Crivellari wrote:
> Currently if a user enqueues a work item using schedule_delayed_work() the
> used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
> WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
> schedule_work() that is using system_wq and queue_work(), that makes use
> again of WORK_CPU_UNBOUND.
> This lack of consistency cannot be addressed without refactoring the API.
> 
> [...]

Applied, thanks!

[1/1] i3c: master: add WQ_PERCPU to alloc_workqueue users
      https://git.kernel.org/abelloni/c/de53ad6ca49e

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
