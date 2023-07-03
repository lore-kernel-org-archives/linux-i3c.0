Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E59D3C30658
	for <linux-i3c@archiver.kernel.org>; Mon,  3 Jul 2023 20:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hZWevDpFThploVbonqrnP/H6itxme0iLTUsGa9Om3A0=; b=gdBA2//BIhg5+U
	JB7lM9oAcNbi61/FD9N8nEnJ8eiRrOVWKkH63dj/hjRFqxJ+GBnv55/EwDZ2PCXwWpdyiM2tTW0OC
	4ygCYYj7kimfaIECo5kctmuhCOqwqSnt9l5QcqoqpiwW+xehXuk1cxTazXUW2nUSWur+0S4sr22Kr
	okIRf6HrbECQ4oJisgC8SXvB7Nh3BeAtOWnPAcP7tsXL+M9IhuOMu+bKzwElTbofWep+BCPVVmLbr
	BGnINV3fGarAMlyBO2oOJoVEZPZTwsTvQ9hzaeK9rkUFDibGML0nZLkf+Hb3Th1EXv+icwDULRa2E
	XueOjanP6AGFWTQ/kNpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGQLL-00BPF1-1T;
	Mon, 03 Jul 2023 20:40:19 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGKmR-00Am1v-2r
	for linux-i3c@lists.infradead.org;
	Mon, 03 Jul 2023 14:43:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=pteZzJsj4EYRrxGttSfyJ3QdTS0O5i9iUaaO/p8LKvQ=; b=VoZUdS8+3fD1nzIi+CDFXQNRUR
	ZyXLatUtPhLQQyPCUWnRDCVI85u+/ljrMWFNcVgGpu1eW1h1pmhLfz6Mc3kpoauCQxYmFSWGJa74J
	Bdtbd/riCPQ9ibHOcdVbeDqs2ljQAYfI87HrCgXUOVPQsbPeDrfwCdl70WeiAC2E1AL4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qGKmJ-000U8I-46; Mon, 03 Jul 2023 16:43:47 +0200
Date: Mon, 3 Jul 2023 16:43:47 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Matt Johnston <matt@codeconstruct.com.au>
Cc: linux-i3c@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jeremy Kerr <jk@codeconstruct.com.au>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 3/3] mctp i3c: MCTP I3C driver
Message-ID: <8321002c-9b75-44da-9200-23d951148ae9@lunn.ch>
References: <20230703053048.275709-1-matt@codeconstruct.com.au>
 <20230703053048.275709-4-matt@codeconstruct.com.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230703053048.275709-4-matt@codeconstruct.com.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_074355_926981_7FE8CDD3 
X-CRM114-Status: GOOD (  24.52  )
X-Mailman-Approved-At: Mon, 03 Jul 2023 13:40:17 -0700
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

> +#define MCTP_I3C_MAXBUF 65536
> +/* 48 bit Provisioned Id */
> +#define PID_SIZE 6
> +
> +/* 64 byte payload, 4 byte MCTP header */
> +static const int MCTP_I3C_MINMTU = 64 + 4;
> +/* One byte less to allow for the PEC */
> +static const int MCTP_I3C_MAXMTU = MCTP_I3C_MAXBUF - 1;
> +/* 4 byte MCTP header, no data, 1 byte PEC */
> +static const int MCTP_I3C_MINLEN = 4 + 1;

Why static const and not #define? It would also be normal for
variables to be lower case, to make it clear they are in fact
variables, not #defines.

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
> +
> +	/* Provisioned ID of our controller */
> +	u64 pid;
> +
> +	struct i3c_bus *bus;
> +	/* Head of mctp_i3c_device.list. Protected by busdevs_lock */
> +	struct list_head devs;
> +};
> +
> +struct mctp_i3c_device {
> +	struct i3c_device *i3c;
> +	struct mctp_i3c_bus *mbus;
> +	struct list_head list; /* Element of mctp_i3c_bus.devs */
> +
> +	/* Held while tx_thread is using this device */
> +	struct mutex lock;
> +
> +	/* Whether BCR indicates MDB is present in IBI */
> +	bool have_mdb;
> +	/* I3C dynamic address */
> +	u8 addr;
> +	/* Maximum read length */
> +	u16 mrl;
> +	/* Maximum write length */
> +	u16 mwl;
> +	/* Provisioned ID */
> +	u64 pid;
> +};

Since you have commented about most of the members of these
structures, you could use kerneldoc.

> +/* We synthesise a mac header using the Provisioned ID.
> + * Used to pass dest to mctp_i3c_start_xmit.
> + */
> +struct mctp_i3c_internal_hdr {
> +	u8 dest[PID_SIZE];
> +	u8 source[PID_SIZE];
> +} __packed;
> +
> +/* Returns the 48 bit Provisioned Id from an i3c_device_info.pid */
> +static void pid_to_addr(u64 pid, u8 addr[PID_SIZE])
> +{
> +	pid = cpu_to_be64(pid);
> +	memcpy(addr, ((u8 *)&pid) + 2, PID_SIZE);
> +}
> +
> +static u64 addr_to_pid(u8 addr[PID_SIZE])
> +{
> +	u64 pid = 0;
> +
> +	memcpy(((u8 *)&pid) + 2, addr, PID_SIZE);
> +	return be64_to_cpu(pid);
> +}

I don't know anything about MCTP. But Ethernet MAC addresses are also
48 bits. Could you make use of u64_to_ether_addr() and ether_addr_to_u64()?

> +static int mctp_i3c_setup(struct mctp_i3c_device *mi)
> +{
> +	const struct i3c_ibi_setup ibi = {
> +		.max_payload_len = 1,
> +		.num_slots = MCTP_I3C_IBI_SLOTS,
> +		.handler = mctp_i3c_ibi_handler,
> +	};
> +	bool ibi_set = false, ibi_enabled = false;
> +	struct i3c_device_info info;
> +	int rc;
> +
> +	i3c_device_get_info(mi->i3c, &info);
> +	mi->have_mdb = info.bcr & BIT(2);
> +	mi->addr = info.dyn_addr;
> +	mi->mwl = info.max_write_len;
> +	mi->mrl = info.max_read_len;
> +	mi->pid = info.pid;
> +
> +	rc = i3c_device_request_ibi(mi->i3c, &ibi);
> +	if (rc == 0) {
> +		ibi_set = true;
> +	} else if (rc == -ENOTSUPP) {

In networking, we try to avoid ENOTSUPP and use EOPNOTSUPP:

https://lore.kernel.org/netdev/20200511165319.2251678-1-kuba@kernel.org/


> +static int mctp_i3c_header_create(struct sk_buff *skb, struct net_device *dev,
> +				  unsigned short type, const void *daddr,
> +	   const void *saddr, unsigned int len)
> +{
> +	struct mctp_i3c_internal_hdr *ihdr;
> +
> +	skb_push(skb, sizeof(struct mctp_i3c_internal_hdr));
> +	skb_reset_mac_header(skb);
> +	ihdr = (void *)skb_mac_header(skb);
> +	memcpy(ihdr->dest, daddr, PID_SIZE);
> +	memcpy(ihdr->source, saddr, PID_SIZE);

ether_addr_copy() ?

> +/* Returns an ERR_PTR on failure */
> +static struct mctp_i3c_bus *mctp_i3c_bus_add(struct i3c_bus *bus)
> +__must_hold(&busdevs_lock)
> +{
> +	struct mctp_i3c_bus *mbus = NULL;
> +	struct net_device *ndev = NULL;
> +	u8 addr[PID_SIZE];
> +	char namebuf[IFNAMSIZ];
> +	int rc;
> +
> +	if (!mctp_i3c_is_mctp_controller(bus))
> +		return ERR_PTR(-ENOENT);
> +
> +	snprintf(namebuf, sizeof(namebuf), "mctpi3c%d", bus->id);
> +	ndev = alloc_netdev(sizeof(*mbus), namebuf, NET_NAME_ENUM, mctp_i3c_net_setup);
> +	if (!ndev) {
> +		pr_warn("No memory for %s\n", namebuf);

pr_ functions are not liked too much. Is there a struct device you can
use with dev_warn()?

    Andrew

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
