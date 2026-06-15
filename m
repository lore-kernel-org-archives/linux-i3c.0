Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0679CD98DE
	for <linux-i3c@archiver.kernel.org>; Mon, 15 Jun 2026 08:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cs/swXxYUF7J0z0BBSBhlu6cejDTJyYDki5dbiIJrmM=; b=g89qajrGF9KiHr
	N9ifab7DqmnbNwVjQ0Nn1mFBRJd+4Zf113iXdwJmB/ViXoEgptMk9NgYwjNteSKW1WfnhkMr7v5dR
	R2+y5+6lvsDJDKLJfzhd2W4e3g+Q+RwIDQyVskSXTcjwM6SdOkiG/D2TKHehoPZe4r1pCENvMdpAp
	SPXoKBGuj7d7ZU0IBFZ4eh9xWOA19MJbCNXCYF2Scxd6l2JewuGn8L/amJ6Av39zoun8L9/NonX4d
	5O0hpB/AP+rgIRE5euVuCp3Hu8cklK6Vc3CsttO62j1ykmMZfF1rAzLTlpp1di+dgXIZccONWM5Re
	OFcfWq4pOAbOnCaAK8Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ38o-0000000DvcT-1qEm;
	Mon, 15 Jun 2026 08:57:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ38n-0000000Dvbs-1aiV
	for linux-i3c@lists.infradead.org;
	Mon, 15 Jun 2026 08:57:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0500343BD3;
	Mon, 15 Jun 2026 08:57:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5E9A1F000E9;
	Mon, 15 Jun 2026 08:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781513876;
	bh=BHDUtQTed+hn+mTvjKKEmuSL1hPlj0o2lJcEyC32cTE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=PeCsM7ZWpojsNSaxbP8P+I+iQlYJBakAK9Iuv0uTWNeUxlVkSBHCCdGbCVY/Fr1oh
	 klmO5QyT5PQtRetTbI5x0K6QvQbe8EX7RG9Kpbfc/uToFCaYdIhkJ5q5KU/+WzThqU
	 U7LaxbYwtJ9SYdAEr/qWlhSooyJ65xThGkjhMwvhSH+lQ+57BvIIOOhcy1YlQyISel
	 KyiKLduYAtHp52fBfNGwaJIRTXQNoxpkGgLuw9NJGBJZTs46V1cUyGHMDhQ960pme7
	 I6DZ8PAx0fzqoL+OGZegcmEZUWxZUJZ4sxW1FPNZdEL9XMxDon3ltXD9rJnCseNOR8
	 XzP0oosjGN8rQ==
Message-ID: <e3f8a05c-85ab-4c29-ae61-b9e81420bbb8@kernel.org>
Date: Mon, 15 Jun 2026 11:57:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/16] i3c: renesas: Check that the transfer is valid
 before accessing it
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, linux-i3c@lists.infradead.org
References: <20260612160458.3102106-2-claudiu.beznea@kernel.org>
 <20260612162039.A5D701F000E9@smtp.kernel.org>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <20260612162039.A5D701F000E9@smtp.kernel.org>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org



On 6/12/26 19:20, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 8 potential issue(s) to consider:
> 
> New issues:
> - [High] The `!xfer` early return path in `renesas_i3c_rx_isr` fails to disable the `NTIE_RDBFIE0` interrupt, causing an interrupt storm.
> - [High] A typo in the `!xfer` early return path of `renesas_i3c_tend_isr` duplicates the `BIE_TENDIE` flag, failing to mask the NACK interrupt.
> - [High] The `!xfer` early return path in `renesas_i3c_start_isr` fails to disable the `BIE_STCNDDIE` interrupt.
> 
> Pre-existing issues:
> - [Critical] The transfer functions `renesas_i3c_i3c_xfers` and `renesas_i3c_i2c_xfers` silently ignore timeouts and hardware errors, falsely returning success.
> - [Critical] Hardware State Desync causing cross-transfer corruption due to failure to abort hardware on timeout.
> - [Critical] FIFO overflow in I3C writes due to unconditionally writing the entire transfer length without progress tracking.
> - [Critical] Out-of-bounds write and pointer offset corruption in `renesas_i3c_rx_isr` during I3C reads.
> - [High] Hardware interrupt registers are modified via non-atomic read-modify-write operations from process context without locking, causing lost mask updates.
> --
> 
> commit 80958e2863c878df9b87948c2774499050e47aee
> Author: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
>      i3c: renesas: Check that the transfer is valid before accessing it
>      
>      The Renesas I3C driver uses an asynchronous model to transfer data. It
>      prepares a struct renesas_i3c_xfer, enqueues it, and waits for completion.
>      The interrupt handler dequeues the transfer, updates/uses it, and signals
>      the waiting thread.
> 
>> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
>> index f39c449922ca2..bc1a0ae1d12d8 100644
>> --- a/drivers/i3c/master/renesas-i3c.c
>> +++ b/drivers/i3c/master/renesas-i3c.c
> 
> [ ... ]
> 
>> @@ -1138,6 +1153,15 @@ static irqreturn_t renesas_i3c_tend_isr(int irq, void *data)
>>   
>>   	scoped_guard(spinlock, &i3c->xferqueue.lock) {
>>   		xfer = i3c->xferqueue.cur;
>> +		if (!xfer) {
>> +			/* Disable interrupts. */
>> +			renesas_clear_bit(i3c->regs, BIE, BIE_TENDIE | BIE_TENDIE);
> 
> [Severity: High]
> Does this duplicated flag fail to mask the NACK interrupt?

Yes, it is a typo.

> 
> It appears the code is meant to mask both the Transmit End and NACK
> interrupts (as the next line clears BST_NACKDF | BST_TENDF).

The scope of the code was to disable the IRQs that are disable on the path were 
the xfer is valid and clear the same bits, to avoid re-triggering the handler 
execution again.

> 
> The failure to include BIE_NACKDIE leaves the NACK interrupt unmasked,
> which could cause an interrupt storm if a NACK triggered the ISR.
> 
>> +			renesas_clear_bit(i3c->regs, NTSTE, NTSTE_TDBEE0);
>> +			/* Clear any status flag. */
>> +			renesas_clear_bit(i3c->regs, BST, BST_NACKDF | BST_TENDF);
>> +			return IRQ_HANDLED;
>> +		}
> 
> [ ... ]
> 
>> @@ -1184,6 +1208,14 @@ static irqreturn_t renesas_i3c_rx_isr(int irq, void *data)
>>   
>>   	scoped_guard(spinlock, &i3c->xferqueue.lock) {
>>   		xfer = i3c->xferqueue.cur;
>> +		if (!xfer) {
>> +			/* Clear any status registers. */
>> +			renesas_clear_bit(i3c->regs, BST, BST_SPCNDDF);
>> +			/* Clear the Read Buffer Full status flag. */
>> +			renesas_clear_bit(i3c->regs, NTST, NTST_RDBFF0);
>> +			return IRQ_HANDLED;
>> +		}
> 
> [Severity: High]
> Can this early return path cause an interrupt storm?
> 
> When a Read Buffer Full interrupt fires, this attempts to handle an aborted
> transfer by simply clearing the status flag NTST_RDBFF0.
> 
> Because the hardware fifo remains full and the interrupt enable bit
> NTIE_RDBFIE0 is not disabled, the interrupt will immediately re-trigger
> when the ISR returns.

I'm not sure if that can happen. The scope of the code was to touch the IRQ 
disable and status bits in the handlers they are handled on the normal path. 
However, I'll review it.

> 
> [ ... ]
> 
>> @@ -1259,6 +1293,12 @@ static irqreturn_t renesas_i3c_start_isr(int irq, void *data)
>>   
>>   	scoped_guard(spinlock, &i3c->xferqueue.lock) {
>>   		xfer = i3c->xferqueue.cur;
>> +		if (!xfer) {
>> +			/* Clear any status registers. */
>> +			renesas_clear_bit(i3c->regs, BST, BST_STCNDDF);
>> +			return IRQ_HANDLED;
>> +		}
> 
> [Severity: High]
> Does this early return path fail to disable the Start Condition interrupt?
> 
> The early return clears the BST_STCNDDF status flag but doesn't disable the
> Start Condition interrupt via BIE_STCNDDIE.

Yes, that should have been done.

-- 
Thank you,
Claudiu


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
