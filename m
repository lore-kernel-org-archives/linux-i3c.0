Return-Path: <SRS0=M/mW=E7=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BFD7C63777
	for <linux-i3c@archiver.kernel.org>; Wed, 25 Nov 2020 09:57:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80EDB2083E
	for <linux-i3c@archiver.kernel.org>; Wed, 25 Nov 2020 09:57:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ypJpuJyJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nf940VeI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80EDB2083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ngoRf0xE0x4B4xAVDAKZ+KJ7KeE4UPR954cO4QXaEIM=; b=ypJpuJyJLpJ/LOhOk1TvwW+AR
	TpKED0zABi/neiQqE8LP986IVN9roQz4isZ+1eYLzfkQotbGHR5ZdSyXOC43NXTBemRwx2iHFW7zY
	dJZgrwg1dh8EM4l6OeltdUGSDS1VQrN7bVOudRUCUEDqBo4OCfHktruOBdQMfM7nnSuQ4scTNNU6l
	GUdRRASRITmKMOAyv/eI0cQn+AgYC4ESIALHol4IZb7p3VoF7eRq1WIR9Lb2wY00Rglth+lQCA8o3
	wsyrwxktjjy4NKXjx01qBvvEbWlRH+Izr8iDkVxJCP85NPea0O1oB5g/8DjRllHUBh7IYI3H9qUdK
	MTqijA9HA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khrYD-0006ZF-Q9; Wed, 25 Nov 2020 09:57:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khZar-0005J5-J2; Tue, 24 Nov 2020 14:46:58 +0000
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 296CF206F9;
 Tue, 24 Nov 2020 14:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606229216;
 bh=3zQtrTTCw8twqJtP/1a4NB1MKrz6/NphiIiwgRncCiQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Nf940VeIUgpffOGETTY1L3G0QcIjfozBFvnFoqG8O328ZSxeeaAXcr0hOe3zQgRlG
 fbix380mdFR2g9eZBg8DhbUZBvf1w7UYgoM6pwiYDzTHildmv27dPl4/uYYBPb4fgA
 1gCiZGhi+wbnwk7bOx0yc8Qq/SRuVl9DTTdMTQVI=
Date: Tue, 24 Nov 2020 08:47:05 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 000/141] Fix fall-through warnings for Clang
Message-ID: <20201124144705.GK16084@embeddedor>
References: <cover.1605896059.git.gustavoars@kernel.org>
 <20201123200345.GA38546@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201123200345.GA38546@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_094657_855619_F61C25F2 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Wed, 25 Nov 2020 04:56:58 -0500
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
Cc: alsa-devel@alsa-project.org, linux-atm-general@lists.sourceforge.net,
 reiserfs-devel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Nathan Chancellor <natechancellor@gmail.com>, linux-ide@vger.kernel.org,
 dm-devel@redhat.com, keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 GR-everest-linux-l2@marvell.com, wcn36xx@lists.infradead.org,
 samba-technical@lists.samba.org, linux-i3c@lists.infradead.org,
 linux1394-devel@lists.sourceforge.net, linux-afs@lists.infradead.org,
 usb-storage@lists.one-eyed-alien.net, drbd-dev@lists.linbit.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 rds-devel@oss.oracle.com, Nick Desaulniers <ndesaulniers@google.com>,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 oss-drivers@netronome.com, bridge@lists.linux-foundation.org,
 linux-security-module@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, cluster-devel@redhat.com,
 linux-acpi@vger.kernel.org, coreteam@netfilter.org,
 intel-wired-lan@lists.osuosl.org, linux-input@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, tipc-discussion@lists.sourceforge.net,
 linux-ext4@vger.kernel.org, linux-media@vger.kernel.org,
 linux-watchdog@vger.kernel.org, selinux@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-geode@lists.infradead.org, linux-can@vger.kernel.org,
 linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, linux-mediatek@lists.infradead.org,
 xen-devel@lists.xenproject.org, nouveau@lists.freedesktop.org,
 linux-hams@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 x86@kernel.org, linux-nfs@vger.kernel.org, GR-Linux-NIC-Dev@marvell.com,
 Kees Cook <keescook@chromium.org>, linux-mm@kvack.org, netdev@vger.kernel.org,
 linux-decnet-user@lists.sourceforge.net, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-sctp@vger.kernel.org, linux-usb@vger.kernel.org,
 netfilter-devel@vger.kernel.org, linux-crypto@vger.kernel.org,
 patches@opensource.cirrus.com, Joe Perches <joe@perches.com>,
 linux-integrity@vger.kernel.org, target-devel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Mon, Nov 23, 2020 at 04:03:45PM -0400, Jason Gunthorpe wrote:
> On Fri, Nov 20, 2020 at 12:21:39PM -0600, Gustavo A. R. Silva wrote:
> 
> >   IB/hfi1: Fix fall-through warnings for Clang
> >   IB/mlx4: Fix fall-through warnings for Clang
> >   IB/qedr: Fix fall-through warnings for Clang
> >   RDMA/mlx5: Fix fall-through warnings for Clang
> 
> I picked these four to the rdma tree, thanks

Awesome. :)

Thank you, Jason.
--
Gustavo

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
