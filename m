Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB0FCAC5A0
	for <linux-i3c@archiver.kernel.org>; Thu, 18 Sep 2025 16:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j39Nz1Vm78QQ6zAOsTS7UQMdP4k/2yDaudopW+YrI1c=; b=hEiomNzTOgfJA6
	xyy8Ge0AbNFKfVmIj/wa4MSrwtUO0vpYOmLXiGtqhYfko/X9uRQEQFUqBYW26xTJ2JCREFdGy/ETy
	J5JvEA3geuqHF9LcWDx2gLvqu5yTOM76q7gcRUzCxYJ2etPxYHTivRUZg5usSoImwEBKTgrBZ0e5l
	wOJHv1OTusCqKtbf0FKCxr06xYO0XoY9fzBr2enN+/dJ03frAs93bEKeGKE5+NriNAZBLoFjZ7ql2
	3291cKhr1+VuvHRQSQR31us4+YgWbvvM/oR8RdVqektV4dttK2MukH7ut5xBWRGgbA3cDp6HHTTKz
	bWmnGSyjD3VvxRSL/ipA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHje-00000000fGu-24wo;
	Thu, 18 Sep 2025 16:43:54 +0000
Received: from ms.lwn.net ([2600:3c01:e000:3a1::42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHjb-00000000fE6-2zEe
	for linux-i3c@lists.infradead.org;
	Thu, 18 Sep 2025 16:43:52 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A0E4E406FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1758213830; bh=okc8cPe2ZWbxfmOUNi5nG+59TfojPQ0/kotl+uzMIx4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=skAot3YMbvaiZa04MZfLYUQLW0PCAhwuSWuoXyO2sFGU7wgEptywDrQ7m4cCgVghX
	 5LR8C0EO7gbcAlQTNnGQZvtcZXrpZ77zp6qbCHzWknWW2Ky8MDtvyZdQJdp5S60SGs
	 3n/t4u+CrQ9yveIFet2KmuZ/bBfC72/5KtV+tlr0C9wPqbfZyEVezcdkt11oude8t0
	 sRJqeqdNVkmOTs8HD88fKmxpz+dzMDYMLBmYM/Mby9blshRxbXJaeW2qys7CTpQvmg
	 Gi8skg2ZVMFjqeimW2bhdjMeAOK16meWZgviUXyrxShz4UmN9dpILXsJ5K/SROYs66
	 2l4ZeDgZHnwkQ==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A0E4E406FA;
	Thu, 18 Sep 2025 16:43:50 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Marneni PoornaChandu <poornachandumarneni@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 alexandre.belloni@bootlin.com, corey@minyard.net,
 sakari.ailus@linux.intel.com, mchehab@kernel.org,
 linux-i3c@lists.infradead.org, openipmi-developer@lists.sourceforge.net,
 linux-media@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, Marneni
 PoornaChandu <Poornachandumarneni@gmail.com>
Subject: Re: [PATCH] docs: driver-api: fix spelling of "buses".
In-Reply-To: <20250917220430.5815-1-Poornachandumarneni@gmail.com>
References: <20250917220430.5815-1-Poornachandumarneni@gmail.com>
Date: Thu, 18 Sep 2025 10:43:49 -0600
Message-ID: <87wm5v7ltm.fsf@trenco.lwn.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_094351_771218_318958D0 
X-CRM114-Status: UNSURE (   6.85  )
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

Marneni PoornaChandu <poornachandumarneni@gmail.com> writes:

> Replace incorrect plural form "busses" with "buses" in
> multiple documentation files under "Documentation/driver-api".
>
> Signed-off-by: Marneni PoornaChandu <Poornachandumarneni@gmail.com>
> ---
>  Documentation/driver-api/device-io.rst             | 4 ++--
>  Documentation/driver-api/driver-model/overview.rst | 2 +-
>  Documentation/driver-api/driver-model/platform.rst | 2 +-
>  Documentation/driver-api/eisa.rst                  | 6 +++---
>  Documentation/driver-api/i3c/protocol.rst          | 4 ++--
>  Documentation/driver-api/ipmi.rst                  | 4 ++--
>  Documentation/driver-api/media/tx-rx.rst           | 4 ++--
>  Documentation/driver-api/nvdimm/nvdimm.rst         | 2 +-
>  Documentation/driver-api/pm/devices.rst            | 4 ++--
>  Documentation/driver-api/scsi.rst                  | 4 ++--
>  Documentation/driver-api/spi.rst                   | 2 +-
>  Documentation/driver-api/usb/hotplug.rst           | 2 +-
>  Documentation/driver-api/usb/usb.rst               | 4 ++--
>  13 files changed, 22 insertions(+), 22 deletions(-)

"Busses" is considered to be a legitimate spelling as well.  I have gone
ahead and applied this in the hope that it will reduce the temptation
for others to "fix" it, but this kind of change in general is a sort of
churn that does not really help the kernel project.  Thanks for working
to improve our documentation, but I do hope that you will find more
useful improvements going forward.

Thanks,

jon

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
