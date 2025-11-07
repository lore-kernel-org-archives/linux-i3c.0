Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2541CCF9E3
	for <linux-i3c@archiver.kernel.org>; Fri,  7 Nov 2025 22:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uVIrOQcuneVoT+fpuRdr9Cy6c1nlFIMfNMQgQDOnwfc=; b=ZMvxNWtO1FtxvS
	0tM/K534JiwvGxcsg9CD2ckow52IlDz9nREIp5keV5yVOYg8K/UOsVfs2B7DluKa/hiG2Z5HMY8HX
	ZUYfTX0HDLhzNCR855ksWf+I3uAVHHiCHg72w6UsarF/JYfdi9Fzzf44Uf7pXX+Gkhnj1beeU4J9h
	JkktuKmgkF531K6K3zZtTxvze7prOL2Yao8pA/XoUu2qoCCyyH4siKS5EqyUjn8L6gpoWrvHzGhi7
	XdYFckCgWipfFRPE5FP2VyvXdy3ns9/DdcwR8HaqaC+ymlkkygauEOoQUqwUAZ1fgdeWdOeWZnoPy
	F0philQNdTZt98GEHqjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHUwh-00000001L59-1vNq;
	Fri, 07 Nov 2025 22:28:39 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHUwe-00000001L38-3xOp
	for linux-i3c@lists.infradead.org;
	Fri, 07 Nov 2025 22:28:38 +0000
Date: Fri, 7 Nov 2025 23:28:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762554511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r05CHmfoNFTHMRYgAoEg/9Ojn29EhWfm42yusnTJdis=;
	b=E//4516Usei6KfxkW0VjO5fwuqvyKu2H9NUR7glhF8Sc06hzlRc7Z6XKWS4IdhLnZk8Umv
	jXR3A9wbj88+PHn1fvmkmgd4we9EGNCyAj9Ar8XqUigx8WfXO4tDmuXJbFutSsVKSGYQ+Q
	d2Y3vVSySqQm5dK4EIQNz5uW575pw+igaPt7aOQUN8fSshT4cx4JZ87Qw/xdLRIa3U2n9Q
	Zaf358lvlY3fjFXyWEVTBPRU2xHIYIhbI0MfQ17tQMm+wxFHXSM0xiWAKIZxxwlv4j61AB
	MvSpdq2l/RBw949y0fGERe6orl/tGlAn0RYO7Be4udr5mHs5bb60Gun7w6Y0WA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762554511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r05CHmfoNFTHMRYgAoEg/9Ojn29EhWfm42yusnTJdis=;
	b=eFp0DbKc5vEkh3T0CEsUE3+9/i5wyzD9RUNLK/kEkYOV1e74GE229kDjSoI6P1CBsEKcFk
	zVd9DlbJEvEofyAQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Frank Li <Frank.li@nxp.com>
Cc: Marco Crivellari <marco.crivellari@suse.com>,
	linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] i3c: master: add WQ_PERCPU to alloc_workqueue users
Message-ID: <20251107222830.oPfVHd-_@linutronix.de>
References: <20251107132949.184944-1-marco.crivellari@suse.com>
 <aQ5d1g95N86lXXT2@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aQ5d1g95N86lXXT2@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_142837_134719_B025AF82 
X-CRM114-Status: UNSURE (   9.45  )
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

On 2025-11-07 16:00:06 [-0500], Frank Li wrote:
> > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > index d946db75df70..519b98c37ac7 100644
> > --- a/drivers/i3c/master.c
> > +++ b/drivers/i3c/master.c
> > @@ -2925,7 +2925,7 @@ int i3c_master_register(struct i3c_master_controller *master,
> >  	if (ret)
> >  		goto err_put_dev;
> >
> > -	master->wq = alloc_workqueue("%s", 0, 0, dev_name(parent));
> > +	master->wq = alloc_workqueue("%s", WQ_PERCPU, 0, dev_name(parent));
> 
> Maybe off topic, I think it is not neccesary to create wq for IBI at all.
> it can directly use system_bh_wq, or other wq.

Do you really meant system_bh_wq or would system_unbound_wq do the job?
The _bh_ one would imply softirq usage, I don't think you want that.

> Frank

Sebastian

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
