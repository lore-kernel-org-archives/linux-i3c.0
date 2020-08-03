Return-Path: <SRS0=EJcj=BP=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37436C433E0
	for <linux-i3c@archiver.kernel.org>; Wed,  5 Aug 2020 08:10:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B57F42177B
	for <linux-i3c@archiver.kernel.org>; Wed,  5 Aug 2020 08:10:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="inPNfjIM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=pobox.com header.i=@pobox.com header.b="dddKWnC4";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b="PLDu4peJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B57F42177B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fluxnic.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OEIGj+eeS4nxz2xiM9l7tCXN/Za1CzcBWIcU1l7NMDs=; b=inPNfjIMVVE4kox5erYA0V0qD
	UJnBwgOwhjQynnFsLg9wUqm6WJej5aaazh1xsyYgxzauF05RQfg7qsBtbM0ywD1sZUJZzCLdN2nAz
	zlBLQU+gUZonfAlByI6NTHtOzku6SeLw66yBaiF5agY5RQQdZKTXqr2BBqRQ+Syylhy7N2lgSMkuE
	bDOcii28qG1XyCcr06SNWKGcOzhCRiIJai9e5iT2DNGsfgCtX+lWJMta051Na/QelxiqifJAruj8s
	EKd42kxH2KvWm+Mt7k2T7hNX1ZMPScVJWwtsD/3QqRn2OyHzjmhFOEtMadAEvwSYuXOWDlJvF+/4E
	cf1RCvqmA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3EVO-0005X6-TS
	for linux-i3c@archiver.kernel.org; Wed, 05 Aug 2020 08:10:34 +0000
Received: from pb-smtp20.pobox.com ([173.228.157.52])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2gwb-0004m5-AS
 for linux-i3c@lists.infradead.org; Mon, 03 Aug 2020 20:20:27 +0000
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 8731CF554D;
 Mon,  3 Aug 2020 16:20:16 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
 :cc:subject:in-reply-to:message-id:references:mime-version
 :content-type; s=sasl; bh=PF90wNMuKpjCQ5V/5619nvwTLro=; b=dddKWn
 C44X0MRBNrallMp/OYIZNUaHHnSOD31wde63SYuclky+jvS7AokK5gpWV4ZpDQp8
 1YS2JK/IY5WAZcq1jarHa6cRuFYp/jvIy4hyBAXdxB5LRAz+W4kPtznwOMHlWmc0
 2aUvRMw7tYOPek0quk9K5ioEvcyKfG+qDDKrs=
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 7F25CF554C;
 Mon,  3 Aug 2020 16:20:16 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type;
 s=2016-12.pbsmtp; bh=Q9xTu3Q7G6ybCTets5WU0b++RTe3jw3gfIDCaIw+Fog=;
 b=PLDu4peJV9GFqRgQ/gK3uKs6SclhX6iumGQpARWgslvZ828s41isyydhcY7iIHhe2e64FRi8PUaMlo1CFSRE4HJYWM8Dru0DeXAh61lbYkj3l5iYcA95R9VwQbau3alTvFj1CKrn/zpzhsFyb/bU85/IesAEyZdhQ/WtDqbkfjA=
Received: from yoda.home (unknown [24.203.50.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp20.pobox.com (Postfix) with ESMTPSA id 6E6C2F554B;
 Mon,  3 Aug 2020 16:20:13 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
 by yoda.home (Postfix) with ESMTPSA id 851B62DA0BFC;
 Mon,  3 Aug 2020 16:20:11 -0400 (EDT)
Date: Mon, 3 Aug 2020 16:20:11 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 3/4] i3c: master: svc: Add Silvaco I3C master driver
In-Reply-To: <20200709080159.2178-3-miquel.raynal@bootlin.com>
Message-ID: <nycvar.YSQ.7.77.849.2008031546570.1112668@knanqh.ubzr>
References: <20200709080159.2178-1-miquel.raynal@bootlin.com>
 <20200709080159.2178-3-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-Pobox-Relay-ID: BCB8755A-D5C6-11EA-B562-F0EA2EB3C613-78420484!pb-smtp20.pobox.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_162025_467836_5903FD8F 
X-CRM114-Status: GOOD (  14.77  )
X-Mailman-Approved-At: Wed, 05 Aug 2020 04:10:33 -0400
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
Cc: devicetree@vger.kernel.org,
 Rajeev Huralikoppi <rajeev.huralikoppi@silvaco.com>,
 linux-kernel@vger.kernel.org, npitre@baylibre.com,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-i3c@lists.infradead.org,
 Conor Culhane <conor.culhane@silvaco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Thu, 9 Jul 2020, Miquel Raynal wrote:

> Add support for Silvaco I3C dual-role IP. The master role is supported
> in SDR mode only. I2C transfers have not been tested but are shared
> because they are so close to the I3C transfers in terms of registers
> configuration.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

I'm worried by constructs like these:

> +static int svc_i3c_master_handle_ibi(struct svc_i3c_master *master,
> +				     struct i3c_dev_desc *dev)
> +{
> +	struct svc_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
> +	struct i3c_ibi_slot *slot;
> +	unsigned int count;
> +	u32 mdatactrl;
> +	u8 *buf;
> +	int ret;
> +	u32 reg;
> +
> +	spin_lock(&master->ibi.lock);
> +
> +	slot = i3c_generic_ibi_get_free_slot(data->ibi_pool);
> +	if (!slot) {
> +		ret = -ENOSPC;
> +		goto unlock;
> +	}
> +
> +	slot->len = 0;
> +	buf = slot->data;
> +
> +	ret = readl_poll_timeout(master->regs + SVC_I3C_MSTATUS, reg,
> +				 reg & SVC_I3C_MINT_RXPEND, 0, 1000);

Here you're in atomic context due to the lock, and 
readl_poll_timeout(() is built using usleep() which may ... sleep.

Also, is it actually possible for execution to reach this point if 
SVC_I3C_MINT_RXPEND is not set?

The rest looks reasonable to me.


Nicolas

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
