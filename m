Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7FCC41513
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Oct 2023 13:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LVcVTZGJNN1Hn0eg7Prob3xFuxfo/eeh+y6ECwHpjcM=; b=ARP/zmQUlPfd5g
	NhA8NClNIGJ81Fos+RWWmIw2eADO83tT6A4rtuZ2o2jiW+bv4KLjj3gEUUtl5JFMA6K9AR5q7qm+H
	SghbvZqUmZKV3emSUW+as+5HF1uxUdSMPhzR1yYGuczMbabzN/wggvgA0b6go+ziwFm7bP/oGo039
	hNSUUQCrkJHKnYkuHRnVh0YJYejcFvrrgYWqOPeyqup/nYG4mqxqosf+3+Sf1II+EO31VCNZdKVky
	rkFnNWE5sHCAO/yDnYcZ1Bnqcw9Z7VEZBui/R+grlmo538TYwY/gnnWDFuUIL4Rd94Q917F/NLHEa
	D/YA9spq0WaX3FQF+zIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsjm0-00CLc2-0D;
	Tue, 17 Oct 2023 13:06:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsfNS-00BfPd-0V
	for linux-i3c@lists.infradead.org;
	Tue, 17 Oct 2023 08:24:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AC2E8612AF;
	Tue, 17 Oct 2023 08:24:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC590C433C7;
	Tue, 17 Oct 2023 08:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697531072;
	bh=tom3LKzD4WPrxoOMlWcXOkaTJL2PCHAzD27eMGNLLx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B4i8S7QlyOLUBlWGp+GiUJgclkY3/COY8qdGHgBtegTU+FIthCnqN1sks4Wchm3n+
	 ZvLhRotboqIec8IrsiX8StkvY4QJl3p4YXrPQVGfgaoHYG1bFBjhxJ+Ww/ONHwroue
	 0t75VJowGk0w74kGckXoH6NbFcXcxzh+HFcGYmJr0mLmxQE6j6rVQ5OrmeojfNONZH
	 T3iu192hCqs6kySjc+Uj40AIw5DsnzDb93EbLE5YY4/638MN7PB8cIMdmkLlZIVfqA
	 h6lrn+w3I8cJD9cTR8PM5mEbk2VFNLkfR60BwGxBHADfAA5y16nMXhRB0e4sv/bfcc
	 5aX79Mq2hXhnA==
Date: Tue, 17 Oct 2023 10:24:27 +0200
From: Simon Horman <horms@kernel.org>
To: Matt Johnston <matt@codeconstruct.com.au>
Cc: linux-i3c@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>,
	Jeremy Kerr <jk@codeconstruct.com.au>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, miquel.raynal@bootlin.com
Subject: Re: [PATCH net-next v6 3/3] mctp i3c: MCTP I3C driver
Message-ID: <20231017082427.GH1751252@kernel.org>
References: <20231013040628.354323-1-matt@codeconstruct.com.au>
 <20231013040628.354323-4-matt@codeconstruct.com.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231013040628.354323-4-matt@codeconstruct.com.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_012434_275710_A4202D7A 
X-CRM114-Status: GOOD (  13.83  )
X-Mailman-Approved-At: Tue, 17 Oct 2023 06:06:10 -0700
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

On Fri, Oct 13, 2023 at 12:06:25PM +0800, Matt Johnston wrote:
> Provides MCTP network transport over an I3C bus, as specified in
> DMTF DSP0233.
> 
> Each I3C bus (with "mctp-controller" devicetree property) gets an
> "mctpi3cX" net device created. I3C devices are reachable as remote
> endpoints through that net device. Link layer addressing uses the
> I3C PID as a fixed hardware address for neighbour table entries.
> 
> The driver matches I3C devices that have the MIPI assigned DCR 0xCC for
> MCTP.
> 
> Signed-off-by: Matt Johnston <matt@codeconstruct.com.au>

Hi Matt,

one minor nit below, which you can take, leave, or leave for later
as far as I am concerned.

Overall the patch looks good to me and I see that Paolo's review of v5 has
has been addressed.

Reviewed-by: Simon Horman <horms@kernel.org>

> +/* List of mctp_i3c_busdev */
> +static LIST_HEAD(busdevs);
> +/* Protects busdevs, as well as mctp_i3c_bus.devs lists */
> +static DEFINE_MUTEX(busdevs_lock);
> +
> +struct mctp_i3c_bus {
> +	struct net_device *ndev;
> +
> +	struct task_struct *tx_thread;
> +	wait_queue_head_t tx_wq;
> +	/* tx_lock protects tx_skb and devs */
> +	spinlock_t tx_lock;
> +	/* Next skb to transmit */
> +	struct sk_buff *tx_skb;
> +	/* Scratch buffer for xmit */
> +	u8 tx_scratch[MCTP_I3C_MAXBUF];
> +
> +	/* Element of busdevs */
> +	struct list_head list;

I am unsure if it is important, but I observe that on x86_64
list spans a cacheline.

> +
> +	/* Provisioned ID of our controller */
> +	u64 pid;
> +
> +	struct i3c_bus *bus;
> +	/* Head of mctp_i3c_device.list. Protected by busdevs_lock */
> +	struct list_head devs;
> +};

...

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
