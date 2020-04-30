Return-Path: <SRS0=RdhX=6O=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B87CC83009
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Apr 2020 08:07:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 118502186A
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Apr 2020 08:07:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sb77cShT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 118502186A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pWsTBYv/B8aVrMOSQpbcovlvPJIBjgjusVi2MCRkhWY=; b=sb77cShT5GgNzQ
	x3IzBitQ99PBHO9Jdb3tGYuAq6S8A2MeNOGXyrppx+w/RIWzIsP20uxTH7/iX3tAn2qZ0gOjXWsQv
	0m53VFVWklstWBkdZ/QTtjviXjVbkneZDtiG0MtE9bly2/o5L0kUFHj9QTJhtngJstWHujq/TVYBu
	Po7Wv2hxwAl4UXVQLMIHuabg1CZ3xxJN7ZeRvslfSjXDW5H3NtgwOpBFR3wMTVmwCErEpRxxH7cev
	irQuhdkpmPo1zm9C7RctYhjz3dmZOsnaOtleMPrpFZMQrz9R41SqmGqd8Y6IE2KBw5uIGCNGlLNOC
	olykR0Z5AICd3gEMUbYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jU4EQ-0000lY-B6; Thu, 30 Apr 2020 08:07:42 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jU4EN-0000kk-0N
 for linux-i3c@lists.infradead.org; Thu, 30 Apr 2020 08:07:40 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id AD6532A0221;
 Thu, 30 Apr 2020 09:07:35 +0100 (BST)
Date: Thu, 30 Apr 2020 10:07:33 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Parshuram Thombare <pthombar@cadence.com>
Subject: Re: [PATCH v6 3/8] i3c: master: i3c mastership request and handover
Message-ID: <20200430100733.4e0dc578@collabora.com>
In-Reply-To: <1587140462-30209-1-git-send-email-pthombar@cadence.com>
References: <1587140398-29473-1-git-send-email-pthombar@cadence.com>
 <1587140462-30209-1-git-send-email-pthombar@cadence.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200430_010739_178130_BD90026B 
X-CRM114-Status: GOOD (  12.83  )
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
Cc: mparab@cadence.com, bbrezillon@kernel.org, praneeth@ti.com,
 linux-kernel@vger.kernel.org, vitor.soares@synopsys.com, pgaj@cadence.com,
 linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Fri, 17 Apr 2020 18:21:02 +0200
Parshuram Thombare <pthombar@cadence.com> wrote:

> +
> +/* This function is expected to be called with normaluse_lock */
> +int i3c_master_acquire_bus(struct i3c_master_controller *master)
> +{
> +	int ret = 0;
> +
> +	if (!master->this || master->this != master->bus.cur_master) {

Let's limit the number of indentations by doing

	if (master->this == master->bus.cur_master)
		return 0;


> +		if (master->mr_state == I3C_MR_IDLE) {
> +			master->mr_state = I3C_MR_WAIT_DA;
> +			init_completion(&master->mr_comp);
> +			queue_work(master->wq, &master->sec_mst_work);
> +			/*
> +			 * Bus acquire procedure may need write lock
> +			 * so release read lock before yielding
> +			 * to bus acquire state machine
> +			 */
> +			i3c_bus_normaluse_unlock(&master->bus);
> +			wait_for_completion(&master->mr_comp);
> +			i3c_bus_normaluse_lock(&master->bus);

Is that really enough? I remember we had something a bit more complex
to handle the case where bus is acquired to send a message to a device,
and another master on the bus re-acquires it before we have a chance to
send this message message. i3c_master_acquire_bus_ownership() was
dealing with that in Przemek series. It seems you've rewritten a lot of
these things. Would you mind explaining why, and how that works?

> +			if (master->mr_state != I3C_MR_DONE)
> +				ret = -EAGAIN;
> +			master->mr_state = I3C_MR_IDLE;
> +		} else {
> +			/*
> +			 * MR request is already in process for
> +			 * this master
> +			 */
> +			ret = -EAGAIN;
> +		}
> +	}
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_acquire_bus);



_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
