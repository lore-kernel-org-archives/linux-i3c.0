Return-Path: <SRS0=Bw26=B5=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D13F2C433E1
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Aug 2020 03:21:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3AB0207BB
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Aug 2020 03:21:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Habn2G9e";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=pobox.com header.i=@pobox.com header.b="EpmwOD8M";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b="S7nD50qy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3AB0207BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fluxnic.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iXix0rpVZcOdKVxJgfhlhSnU25d8khTeP6HrGHJVpd4=; b=Habn2G9egcfda3ACD91A/wH3e
	qHo3KRyhvCjogf5JPagyUvB5k1oqjSo4fjtZQLBOl4Y9BGhJdj5k9UjrSGwownVVH/UR9L+UlrgBS
	x2LKRLnnMmwq3vy8Rns3PF3ivq/Rzy5YvAQV/DlxkefgcbQtNzPlsZlZOq/BgwaPKVZRMFmaAtpyX
	+GDS/Gy9Q6O1yViSsS/ZRc8cS1o58LrRKE3jCEaru/qBIkWRKWkKvlN5DjLB4kzUX50sRdTu7mLqD
	yOZZdfAt1jQFCJ+FsM5zWGZThhxdEI6ouYBxIk7rLPbzcSNqZVIDGDHSv6vI/Hihkl0vHRE2kqR9g
	zf1HjRzFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8EfE-00019n-4Y
	for linux-i3c@archiver.kernel.org; Wed, 19 Aug 2020 03:21:24 +0000
Received: from pb-smtp1.pobox.com ([64.147.108.70])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8EfB-000195-Ql
 for linux-i3c@lists.infradead.org; Wed, 19 Aug 2020 03:21:22 +0000
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 647E67E099;
 Tue, 18 Aug 2020 23:21:21 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
 :cc:subject:in-reply-to:message-id:references:mime-version
 :content-type; s=sasl; bh=seX3cwT57k3X+Wr6pk1P7Eg3Gt4=; b=EpmwOD
 8M1SpeJ/phxlJIaaLei3v2c/DuyrmFVlX2AlIHxNWIKebQAlQX7ySQZXCQCbw0QR
 1ADB6uF+VDs+bBSdUAMQ2bEsbviYYwvc79Md83RPSERMnxy9iY+XlH1jiAPjO/In
 fEu9fsOknncm6seL5h2f8hK+V2Lvgq/IxNxG8=
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 5B8667E097;
 Tue, 18 Aug 2020 23:21:21 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type;
 s=2016-12.pbsmtp; bh=meibzskveTDwdkGhaPA5kEwFNnfN54+dx3HzO8+5ngg=;
 b=S7nD50qytkVXXFVBJ8H3sUSSCnmdk8IoMqlV3+UO1wj86GlMNkPy7L5jjgzRt8kx6rkhAto6Spk0+q597FaXfUj3n92scH2V2vtYj3Org3rrcfvQRvP4v4mkxqjeDiU/qFBeJb7z+ZTLR6AIipM5zeZlQsQsWALtU/0sy8cCNHQ=
Received: from yoda.home (unknown [24.203.50.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 9D90A7E095;
 Tue, 18 Aug 2020 23:21:20 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
 by yoda.home (Postfix) with ESMTPSA id AA9F32DA0182;
 Tue, 18 Aug 2020 23:21:19 -0400 (EDT)
Date: Tue, 18 Aug 2020 23:21:19 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 linux-i3c@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] MIPI I3c HCI (Host Controller Interface) driver
In-Reply-To: <20200819031723.1398378-1-nico@fluxnic.net>
Message-ID: <nycvar.YSQ.7.78.906.2008182319060.1479@knanqh.ubzr>
References: <20200819031723.1398378-1-nico@fluxnic.net>
MIME-Version: 1.0
X-Pobox-Relay-ID: 0D56F382-E1CB-11EA-B686-01D9BED8090B-78420484!pb-smtp1.pobox.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200818_232121_934860_E96EA0A0 
X-CRM114-Status: GOOD (  19.95  )
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
Cc: Laura Nixon <laura.nixon@team.mipi.org>, Rob Herring <robh+dt@kernel.org>,
 Matthew Schnoor <matthew.schnoor@intel.com>,
 Robert Gough <robert.gough@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


Of course subject prefix should have been "[PATCH v2 0/2]" here.

On Tue, 18 Aug 2020, Nicolas Pitre wrote:

> The MIPI I3C HCI (Host Controller Interface) specification defines
> a common software driver interface to support compliant MIPI I3C
> host controller hardware implementations from multiple vendors. This
> is the initial Linux driver implementing support for this specification.
> 
> Due to limitations in the I3C subsystem, this driver doesn't implement
> everything the spec specifies. For example, scheduled commands,
> auto-commands and NCM are major features not yet supported.
> 
> There are different revisions of the spec: v1.0, v1.1 (to be released
> imminently), and 2.0 (still under active development). All of them are
> supported with varying degree due to the above. And of course v2 support
> is likely to change as the spec is finalized, but it is included now
> in its preliminary form as all I have for testing at the moment is based
> on an early v2 draft.
> 
> Even v1.0 hardware is still scarse so it hasn't been tested yet. As more
> hardware becomes available for testing it is expected that adjustments
> will be needed on top of this submission. But it is best to have the
> current code merged earlier so it gains better exposure for future
> contributions.
> 
> Feedback appreciated.
> 
> Changes from v1:
> 
> - moved DT binding to schema format (Rob)
> - fix sparse warnings (kernel test robot)
> - fix build warnings on 32-bit targets (kernel test robot)
> - avoid PIO_OFFSET symbol conflict (kernel test robot)
> - minor cosmetic changes
> 
> diffstat:
> 
>  .../devicetree/bindings/i3c/mipi-i3c-hci.yaml   |  41 +
>  drivers/i3c/master/Kconfig                      |  13 +
>  drivers/i3c/master/Makefile                     |   1 +
>  drivers/i3c/master/mipi-i3c-hci/Makefile        |   9 +
>  drivers/i3c/master/mipi-i3c-hci/cmd.h           | 106 ++
>  drivers/i3c/master/mipi-i3c-hci/cmd_v1.c        | 362 +++++++
>  drivers/i3c/master/mipi-i3c-hci/cmd_v2.c        | 280 +++++
>  drivers/i3c/master/mipi-i3c-hci/core.c          | 801 +++++++++++++++
>  drivers/i3c/master/mipi-i3c-hci/dat.h           |  28 +
>  drivers/i3c/master/mipi-i3c-hci/dat_v1.c        | 170 ++++
>  drivers/i3c/master/mipi-i3c-hci/dct.h           |  16 +
>  drivers/i3c/master/mipi-i3c-hci/dct_v1.c        |  36 +
>  drivers/i3c/master/mipi-i3c-hci/debug.c         |  79 ++
>  drivers/i3c/master/mipi-i3c-hci/debug.h         |  17 +
>  drivers/i3c/master/mipi-i3c-hci/dma.c           | 781 ++++++++++++++
>  drivers/i3c/master/mipi-i3c-hci/ext_caps.c      | 249 +++++
>  drivers/i3c/master/mipi-i3c-hci/ext_caps.h      |  19 +
>  drivers/i3c/master/mipi-i3c-hci/hci.h           | 150 +++
>  drivers/i3c/master/mipi-i3c-hci/ibi.h           |  42 +
>  drivers/i3c/master/mipi-i3c-hci/pio.c           | 961 ++++++++++++++++++
>  20 files changed, 4161 insertions(+)
> 
> 
> 

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
