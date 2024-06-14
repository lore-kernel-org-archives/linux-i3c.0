Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A490C27C77
	for <linux-i3c@archiver.kernel.org>; Fri, 14 Jun 2024 14:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3MmRLz9mp/n8E06S+OlhmSy+nRcQGamBVbjg084m6o8=; b=g0s1XN4weYzwq3
	loi3fFUXqDhH48P+W0qB226MvyokYgRIlhKjHC9RUoHnkgfkL8t/4Eg9xzE4vycHLkdTywSffLCV9
	QdkwdWmKt2mgKeKf93A2vAIFd8ZAg/i9xG++uwwC6sX/odxDKq8XvmVt/NmbjOUnBl37xP1ev3nga
	roYELFTb0lKG2dZAvg774wFyTqR1AkFl71BETmG85QwFxEjsM0Icmv+u6lMn+uVyp+R9cWwXwlxua
	8WWkcFbj16Y4ZCyPFfPsudlErn4Idgb9LvKkP3HP4NfsrsI9irgeo/4vZJKWqv168tKuFsSn/eGEv
	3iGqTtMAbEjpNjxj/LSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI7hP-00000002yWJ-36z5;
	Fri, 14 Jun 2024 14:14:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI7hN-00000002yVv-13Ld
	for linux-i3c@lists.infradead.org;
	Fri, 14 Jun 2024 14:14:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6CE7C61F62;
	Fri, 14 Jun 2024 14:14:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE957C2BD10;
	Fri, 14 Jun 2024 14:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718374476;
	bh=QvM6AiLxXHwd+MTKu7emfVI/crem08NTejujxmd+2tw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fPPscUx9It4zjfO2x/hpJIIwW07iIO9lzkYPQNZrkK/FKpghbgb1zPTE9Cy/KW3/g
	 10lj3mV/v2qjhfco3YDryIYt0P1mFq3hybUoiJ1yRXUtSIgWC6iG7YPMDtlsFTJeWY
	 phSG8GJgRuquZPwUOEXaqZS3GWi/+j4fZ7Qv1ECo=
Date: Fri, 14 Jun 2024 16:14:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] i3c: mipi-i3c-hci: Fix number of DAT/DCT entries for HCI
 versions < 1.1
Message-ID: <2024061426-kilowatt-scorpion-efd4@gregkh>
References: <20240614140208.1100914-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240614140208.1100914-1-jarkko.nikula@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_071437_396018_1B362EA9 
X-CRM114-Status: GOOD (  13.77  )
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

On Fri, Jun 14, 2024 at 05:02:08PM +0300, Jarkko Nikula wrote:
> I was wrong about the TABLE_SIZE field description in the
> commit 0676bfebf576 ("i3c: mipi-i3c-hci: Fix DAT/DCT entry sizes").
> 
> For the MIPI I3C HCI versions 1.0 and earlier the TABLE_SIZE field in
> the registers DAT_SECTION_OFFSET and DCT_SECTION_OFFSET is indeed defined
> in DWORDs and not number of entries like it is defined in later versions.
> 
> Where above fix allowed driver initialization to continue the wrongly
> interpreted TABLE_SIZE field leads variables DAT_entries being twice and
> DCT_entries four times as big as they really are.
> 
> That in turn leads clearing the DAT table over the boundary in the
> dat_v1.c: hci_dat_v1_init().
> 
> So interprete the TABLE_SIZE field in DWORDs for HCI versions < 1.1 and
> fix number of DAT/DCT entries accordingly.
> 
> Fixes: 0676bfebf576 ("i3c: mipi-i3c-hci: Fix DAT/DCT entry sizes")
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
>  drivers/i3c/master/mipi-i3c-hci/core.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
