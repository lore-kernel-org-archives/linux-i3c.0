Return-Path: <SRS0=korR=B6=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4280AC433DF
	for <linux-i3c@archiver.kernel.org>; Thu, 20 Aug 2020 18:44:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A2F7206DA
	for <linux-i3c@archiver.kernel.org>; Thu, 20 Aug 2020 18:44:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VybM9yl9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=pobox.com header.i=@pobox.com header.b="FGGRRbgE";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b="LqOtEcUo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A2F7206DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fluxnic.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2ijZu9nL0N7f/2Zbd46xvEmdXC1jkK9a7veK6ZGyheI=; b=VybM9yl9y69/HPXugQS0hDh3U
	sjJlN8pnccwrVOkLyzKdmErpBV8xsLi9zyDjCcrg5Q53ozvj/g3jGU4N1Aom6fB480u0ZoE+aCSL/
	n0G3BQhtUJtk9EAGJVPg/Sx4FkhjUIcK1ckfiHDRGbiWXpL/Zp82l9YTdEDdb/RT4fol9+c7IQTCF
	hvsFT2cWYm4fbRKBPM7NcAvt8AbnT8PL4hB7G9ul9RIXSGb8HtlF1aslZJ6H7x0HgXKD+7J0Ji0l9
	W+0+VcuYOJ6uOm8CSORnVKN/zJomcxnvZkaREAWvS5fAy6hV/fNrl8sMxTbgspahdvIY4K8zY98RJ
	jzQrI7UxQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8pXp-0004ax-8Z
	for linux-i3c@archiver.kernel.org; Thu, 20 Aug 2020 18:44:13 +0000
Received: from pb-smtp21.pobox.com ([173.228.157.53])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8pXn-0004aP-2t
 for linux-i3c@lists.infradead.org; Thu, 20 Aug 2020 18:44:11 +0000
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id E4FCFD7782;
 Thu, 20 Aug 2020 14:44:06 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
 :cc:subject:in-reply-to:message-id:references:mime-version
 :content-type; s=sasl; bh=UomrMm5bcgzpxgdvjlxwU/yEVXE=; b=FGGRRb
 gELH5cyjzd1Avhb6ilcDU5hDjN9cGhPp55eKeFVvqkfctRrvWenlYmywhmcqNWA6
 Oagp7Y/d1vJAW6bJ7rU6gZS+9bG5XkCdGaTKVrI6ZFOxlg/SiQNxZZY16Gfd3/l+
 D/wu+zJS7u7Z9WXn9HeAfzEmzi5lX+vHVN07M=
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id DD0C9D7780;
 Thu, 20 Aug 2020 14:44:06 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type;
 s=2016-12.pbsmtp; bh=c/Nfirp6joUaEo3iAz0m08gMi6Aof9jBfhAxKUXLcJA=;
 b=LqOtEcUodIZ1k+UveOqJcwsi3xXN8Ai+9MMDlSsCa+XmHZxLaymygxKJXwkiY+HsMatTBw3hdtRfaL0yFs4RSo0//P78uETIFHPl1o5VKcUuH/asb3mK6SjeuujqfN4MPZb+OH1kP/DO25BUYOSWgLG7zM0bLhT7qMa0UOLmZZg=
Received: from yoda.home (unknown [24.203.50.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id C9F45D777D;
 Thu, 20 Aug 2020 14:44:03 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
 by yoda.home (Postfix) with ESMTPSA id EDCAD2DA01C4;
 Thu, 20 Aug 2020 14:44:01 -0400 (EDT)
Date: Thu, 20 Aug 2020 14:44:01 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 2/2] i3c/master: add the mipi-i3c-hci driver
In-Reply-To: <20200820191424.29c42972@collabora.com>
Message-ID: <nycvar.YSQ.7.78.906.2008201425490.1479@knanqh.ubzr>
References: <20200814034854.460830-1-nico@fluxnic.net>
 <20200814034854.460830-3-nico@fluxnic.net> <20200820100829.0e44200a@xps13>
 <20200820103944.08a55ba4@collabora.com>
 <nycvar.YSQ.7.78.906.2008201234370.1479@knanqh.ubzr>
 <20200820191424.29c42972@collabora.com>
MIME-Version: 1.0
X-Pobox-Relay-ID: 1EC7AEEA-E315-11EA-B4B7-843F439F7C89-78420484!pb-smtp21.pobox.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_144411_276744_CC718C28 
X-CRM114-Status: GOOD (  26.59  )
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
Cc: devicetree@vger.kernel.org, Laura Nixon <laura.nixon@team.mipi.org>,
 Rob Herring <robh+dt@kernel.org>, Robert Gough <robert.gough@intel.com>,
 Matthew Schnoor <matthew.schnoor@intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Thu, 20 Aug 2020, Boris Brezillon wrote:

> On Thu, 20 Aug 2020 12:47:49 -0400 (EDT)
> Nicolas Pitre <nico@fluxnic.net> wrote:
> 
> > On Thu, 20 Aug 2020, Boris Brezillon wrote:
> > 
> > > On Thu, 20 Aug 2020 10:08:29 +0200
> > > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > >   
> > > > > +		/*
> > > > > +		 * TODO: Extend the subsystem layer to allow for registering
> > > > > +		 * new device and provide BCR/DCR/PID at the same time.    
> > > > 
> > > > Not sure this is needed if you don't use it directly as the core will
> > > > anyway (in its current form) send the relevant CCC to read these
> > > > registers.  
> > > 
> > > We considered optimizing that in the past but that means making the DAA
> > > and SETDASA registration different. I'm not sure it's worth it to be
> > > honest, PID/DCR/BCR only happens when initializing devices and I
> > > suspect the overhead of querying those DATA twice in case of DAA is
> > > negligible anyway.  
> > 
> > Wellllll... I know some people who do feel strongly about this 
> > particular issue for some reasons.
> 
> Mind developing a bit why? Boot-time maybe?

Mind you, I'd prefer for those people to argue their use case themselves 
as I'm still not fully convinced myself. But yeah, this has something to 
do with latency.

And v2 of the spec goes a step further by making the DAA procedure give 
you the PID/DCR/BCR of the winning device before you provide it the 
address to be assigned, so you could skip SETDASA/SETNEWDA altogether by 
giving it the final address up front. But in order for this to work the 
subsystem would have to provide a query method that would go like: 
here's some PID/DCR/BCR: please give me the best address to assign this 
device... oh and do so within a 150ms delay.

> > So I'd prefer giving them some hope 
> > and leave the door open to some i3c_master_add_i3c_dev_and_info() 
> > interface. In the end, it's just a matter of pre-filling the info struct 
> > and skipping the PID retrieval in i3c_master_getpid_locked() if already 
> > available, etc.
> 
> I'm definitely not closing the door, but I'd like to understand why this
> is so important to them :-). Anyway, if the changes are not invasive, I
> don't have a good reason to refuse it.

Right. At least now you've been warned this might be coming.


Nicolas

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
