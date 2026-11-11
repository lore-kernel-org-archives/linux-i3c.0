Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79195606A33A
	for <linux-i3c@archiver.kernel.org>; Wed, 11 Nov 2026 05:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rHqVilhe;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PP1aWSXB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EKP2GLZkpLkjG8FEqPxte6MgTnyppDA0t7sWt0rkPfw=; b=rHqVilheA9OHT/4gT9FvZDCns1
	8c3Ahn4LrQqvWcga7OBCvcNLlO9WwcXhQrb1arluQgd8zOJ4GHUCrCizBJ1ov6MCkM1FQcdk3Njia
	lPNZPF8zu6PA5uxHsg7u04R9y+Zo81qD+V/Ad7NH67itBnDNx1l2H2UZXsRViaGWGy4848YZe2wKo
	rwlNUMGSN0iruzqRHvKfFTZBZrgz2h2XllkUD/drUmfAug7Y/Km9t2/Vm0z2CWn+xU1e6R8cSEM/G
	+bYEv9Jxn3vci7FQMZ5rn9UcaXNTAVXqLUVQNO6ShlWcEvFUieSL92gfXU4ZFvLAKqgPHx7wtCdid
	ak0MlQfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR0lo-00000005es8-0K01;
	Wed, 11 Nov 2026 05:21:16 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR0ll-00000005ern-0Br5
	for linux-i3c@lists.infradead.org;
	Wed, 11 Nov 2026 05:21:14 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-8b305e10ac7so29718857b3.0
        for <linux-i3c@lists.infradead.org>; Tue, 10 Nov 2026 21:21:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794374471; cv=none;
        d=google.com; s=arc-20260327;
        b=kWokZhD7dyuRab0+uc5vQwklAhVmNQ9egj/kbyXHmSN0uPxtJ6AiBeR3o+nCAFcBBy
         y+CSkwqKN0z3qe0eJawmcLvaWYaaZJKxfZkZOD2gB0CQbrLq43r8I2sb+OQTHjbWy+Yd
         x5Lm4ASxq2rBuU4/YM+LbP6GeoEt0Y0GBdbA2JiijuMPYAxXjHarpAzEq/61ssKYutMQ
         9uKOEC9TvQbKGQeQ+gybFAXHC+Oyr1zNnkAjZTAPNA2Y9I5d+kFEUkJJywfHeKIGjnWa
         ptiHrm6PsyjAgBt8EgH5VLIpUnCiv4r6Nl5N/tmysIsFlo3H0fl0brMqUzTWnBtH/i2E
         YPQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RXOGahbdzWVuKRFOMy3n7+L/nT19itnfVGdhqWQoYgk=;
        fh=zpmhwjzKMILOmr1L2mmyrldSx2yw9kqCSzVLLpojJgY=;
        b=QCindhhXYgcPTA5WHRphv9MlFrqPdwMmsfLFnJXguTWHudqH3p/SIOrfwiQyBJCTTt
         vrXI981VeKKVPN7oJ5LXKbxYIaV/hIxcRrD8rh1C1PE9XpOp+q6BWmnaxNn2rsA4vqt5
         XWcgP7g/3exfcbDDtPqSKu3o82J+/eggRfPNJ4Pzm35RUar1GQG563dELTq92yRdN8U2
         SOJ4fdeuK9jZ3TrMV22HbXTro2DJzHB+BNVj/Ml5YPLHwAkKZwDwwXoxKFSaw7TAsCGc
         gngQrmNUnru37J3MTO9WN1zutKPswnJxSK3palaPUzC66ht0aH0xB1zy9JLrLVYaJk+O
         +OIg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794374471; x=1794979271; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RXOGahbdzWVuKRFOMy3n7+L/nT19itnfVGdhqWQoYgk=;
        b=PP1aWSXBn2X9An3NpbRc3i1Q1uFgSai1umS6WzhRmoegx2FGH/ts5C49hNVnBdm7M5
         XAhiFOhl9jI55MtitQGFXE+STLqeReoCard/v6nxA1juNPzpqwbhzafjEw+Kq39U1ekf
         Uxm3wEGdxP47Z3aNgioScYJ2couo3Wy201CCezMzgJP4TPwCDHgcWHzpBI2vCxSeHdZF
         xmHVtt1+LCQ+0tk8mUEW4yKwXlXvTXnqy1oJRvx9Eiw693giEstC23jvriX65PiYyeWX
         aDPBm6SDqujd30VBzkyBxkqQDBXxFilY2IHF3IPWb5uoBwDt5Xx1HQ7QYBhlYSHqlPoc
         QiGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794374471; x=1794979271;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RXOGahbdzWVuKRFOMy3n7+L/nT19itnfVGdhqWQoYgk=;
        b=hIhiGGcMcHfTq+iYQCfrE5aXlL+OVR1mDn4DeM/pPcfq4Wlb0Tp9KHMFyIPCBIy58n
         5p/pzb1vpRWWn6IZsT/pryf3TNi398SGqZYCYlZcV4F/xRb/rINh1ZxCYXRvYRVFtQGF
         /QjXz1R4+89ya7AznkFmJTf61nDdit5TJ4vfdbETxv2LoE1WxbTvO3ZSMp3puWy+IVAG
         d/wTiHnHFVE7gmfijZh0aMYJLzmEFMsFTtL3t5IWRgGbGuKx/T93/vXhHQ73sevt6bHA
         u2RUrd3kuhQgw1EHlhtHScf9Crb32hbDHc5/8EN5j9AHZKlZ7pYeDTuysqtdoW2Flaa5
         IETw==
X-Forwarded-Encrypted: i=1; AL+hErElydCJlP0LywGNDC4VKUGdu37OcphRjftQSethh1llRPoq9kvXz9+wnt9WIWGsBKpl7prHC6dEo14=@lists.infradead.org
X-Gm-Message-State: APuU4Z+uYunQIAd66sYslHzxxFirjHjeRYi1XhLO50yA/dpDNpcobQtn
	J7CrfsLyQtvlJ+NS+49ZYEGslnF4ojH8BUnZ23gFJ0eQ204O5LRl9UwUIWr6UMBpCmxvNB60N0l
	v0xPxRb3D0qrTdDPuaD6iritftFdyNTbooTOn0vOU
X-Gm-Gg: AYBFou18y6cLTQ6dLNeVSZgFQhn3BqygvBgBwmoJbUBao8VxsozrEFK4HL8hS+F7oUM
	9uJunzn1qvywgNtato7u+juRDImwJKIBa/pIk8j+LZQXc4hPTEQddFzRzHg67YkTLt3CILPDoB5
	EMYF6HhSaOfwj50khL5Dn4wrj/PIhq2x43jKXKIZLx7Nl78LowfwsJMsSoT0/fASLr5gBQgDEPf
	e7ZyzFy1TJcwo29eYwtynilHF9NllnIrWvfuARQMNzHIbfijM2Qz4UCyZZpzBIuXTyM+WFwRb3c
	VKr44yE0dGXnHNf5GgXDrzrJO0/71HPYnsTIfRschJaPv+eeL3c/uW1UR6M7AX4DiBMLATqILMU
	4W19FZ/et0staMZwHSBzs6By/Iv7A3dU5fl3VNSu4gevr1qGl/YDJoLv9EFTWQ+dwV0rPQw==
X-Received: by 2002:a05:690c:30a:b0:8b3:8e07:5748 with SMTP id
 00721157ae682-8b3a8030b96mr14175687b3.15.1794374470120; Tue, 10 Nov 2026
 21:21:10 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <as487H8-0Gc77mXI@ashevche-desk.local> <CAHreonHiesGbR4VB+3sRxoLDmNHXFFEB=6_o6TNedm-N6VksEQ@mail.gmail.com>
 <atXmovzepBLP8Mqo@ashevche-desk.local> <atXnS1ZKGVfHDNEK@ashevche-desk.local>
 <CAHreonFnUSKJMUpR0rmsnSMHEhcJ_W332_NTcGfTKiRkkPse_w@mail.gmail.com>
 <202610210957562f3f6511@mail.local> <ati4B33tnKsCD4c_@ashevche-desk.local>
 <CAHreonEbHrPCCro+2u5LC2reVk2fzprC4sTLi00nyh8U1=VdXA@mail.gmail.com>
 <at8xuIWvvqLoicTg@ashevche-desk.local> <CAHreonEjSXs7ecOrCtqXh3gXdkGeqK=8mgjTUHLk3q0aOuP4pA@mail.gmail.com>
 <avI_2ddihPu_sxCe@ashevche-desk.local>
In-Reply-To: <avI_2ddihPu_sxCe@ashevche-desk.local>
From: Sam Agazaryan <samagazaryan@google.com>
Date: Tue, 10 Nov 2026 21:20:57 -0800
X-Gm-Features: AclHuK9gdG5vOoLD06a3GoihO_fXbfpPw8TAe91NaL38BBX0ECeG9MjkEFhezWM
Message-ID: <CAHreonE0S1HS4mHb9J=z1TAyY2Au1GFC+E6fjiYa7jDdsqdBrg@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] i3c: add i3cdev module to expose i3c dev in /dev
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i3c@lists.infradead.org, 
	Frank Li <Frank.Li@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Adrian Hunter <adrian.hunter@intel.com>, 
	Meagan Lloyd <meaganlloyd@linux.microsoft.com>, Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_212113_099727_3FAE1848 
X-CRM114-Status: GOOD (  16.75  )
X-Spam-Score: -17.6 (-----------------)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> > An in-kernel driver would need new sysfs ABI for this, and that ABI
> > would have to grow as the spec evolves: v1.1 alone added multi-stage
> > activation, flashless boot and the indirect FIFO interface. With a
> > target-scoped transfer interface, none of that needs kernel changes.
> > fw_upload and lib/pldmfw fit well where a kernel driver already owns
> > the device; here the only consumer is the BMC's management stack.
>
> Yes, and I see no issues with that. Opening the whole i3cdev just for the same
> reason sounds like an overkill. Especially if we do *not* expect any more users.

OCP recovery isn't the only user. In her thread, Meagan described a
separate one [1]: accelerator cards that plug into different server
SKUs, where the I3C hubs and devices on the bus can differ per SKU, so
the hub setup has to be discovered and programmed from userspace at
runtime instead of being fixed in devicetree. She posted her own i3cdev
series and can speak to the details better than I can.

Also, with the explicit binding planned for v6, i3cdev would not open
the whole bus. It would only bind device classes listed in its ID
table, starting with the OCP recovery DCR, and any other class would
have to be added there deliberately, with its own justification.

> If there are success stories, those examples might help to justify your
> approach. It makes sense to mention that in the cover letter with the
> summary on their designs (and split).

Will do. I'll summarize in the v6 cover letter.

[1] https://lore.kernel.org/linux-i3c/20260924-86692413bdae0e78a12c1425@linux.microsoft.com/

Thanks,
Sam

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
