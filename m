Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54500C54755
	for <linux-i3c@archiver.kernel.org>; Thu, 15 May 2025 09:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kQ56Qp2t4pSaD/mHQCSEAO2KaqbzJTdhqPJiakIYGOs=; b=geRc5d+674yJI6
	C+6m4JS+5LzEnzesfNeg04EyyG0pP4J86ZWi3MCaKmNorK0t7T4hfD8TLQRD1qODP7amjqxtyAXqV
	gUvrJjL6jLHZqV1f0h9BSmyYwvh2S6c1zVwYJY1b7q+p+g5nm9FfUgz/e5yGOc+368KuODInyHNP1
	eXOq2lXqhY3WIYmXZkuXRB682Ym9z7D6EhJNVq+Ac4jw7p02T8tGTggvXM4xVXWqlw40pYSS5Hl6y
	dyvblS/wXOZQ4MM9CWzK0Uj0hSbXbOqgFC8E3opikbFFJFm2qLDNUl3xd3pZCCuLa5PCBtQK8MEM+
	INt+MRca47/mUfnktEOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUle-000000008Yj-2gwh;
	Thu, 15 May 2025 09:20:43 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8bcQ-00000001nIX-37vI;
	Sat, 26 Apr 2025 09:14:43 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7376e311086so4234342b3a.3;
        Sat, 26 Apr 2025 02:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745658881; x=1746263681; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dpw6EJump0TSOrBYBam8lLy7cnOl6Tzi7s2IdyQv1Eo=;
        b=cTbsGDxSTLjSsPcQCMhE9goSDIoS/BvDqPZl1LqjMUjlHtz4gMmA4EaLwyJku9dCe5
         iBzIVlVIXRSofqhDhtNwg3ojm0ELAS4hZLEpQnSiKGWmgKGseieK6+ukvlW3Tx4GZBi0
         r7fd0NEM11vrzlc7Q24tE22noG15Mn0VohAR7lV0qFjSKris4+rsuU1xeF8hQQEFNZU9
         R15b7u/AapGmjOm3Z7amLGSzKiSxA0FSyd4roswITRBX1glR1HIl/Fz7HfebowTwiquo
         ZNwL/GqJKipTvZCeHf1hyUhLR+vP2DPsrcGElPzkaK59kALUXXi8BhxbdxBOSdyrtH5J
         eQew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745658881; x=1746263681;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dpw6EJump0TSOrBYBam8lLy7cnOl6Tzi7s2IdyQv1Eo=;
        b=RJ1qFevwfTIEDWEctjkfp/+e5d0/9PXtx4s3pfzr5kzVnt91mMNJg8BYfblKXNVPzo
         uyi6XadDyj3soXj2dmApO+HA5ONhEntHY/dUjQFqWJyjf6v2G/NSxWeXbv9lQdaQTIdt
         k2YLhelrLgyJiJo1juL35aQ1RgoaC9iYHM49DBP/N1yKhF+NlM+ubOEWWfdMrkNxJtlt
         1rrUadS8VZ+lPl0btUnxHGNDrYtyWcCr6UnI3edZOffKKHTEc7ZmgRlLQmjKmeVYYN5Q
         gvZEmNCn8VWkB1xVt5iA0EQviVWEKB2PMvuSXOiKcFgQ16s0f8MUGEF2Y5yEFoG1Sqva
         sT5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUu4StV44Zhm8pfFyshyXpvLmB7DB5CdDXSUTVoJBruOPPwcAXYekcvfofZVMEIzbLUzvJk6jfpxsg=@lists.infradead.org, AJvYcCVaXhxRpQoEdp2NKz8Un2+tWOMzUPnIsnAAIc4P2GlOZ+M+Bzrw3/IhtalFO27GUUj17bz8pPdIZtj9@lists.infradead.org
X-Gm-Message-State: AOJu0YyzuoVFI6+dgjFQISQw/UPYRdrBygA3rn8UmmQ/xbAgbUyEbtFV
	vF4Qp2VWduma8mjz1HPnua0iTFr13529dbg8bHgMU5SWVtT+t4vI
X-Gm-Gg: ASbGncuya/gQxUO0Sb8ZxtbrUB41kFGBnAMXF6eoHUbiqLOq4laiAhmsxUcc3G4DHKO
	zkNziLd+FCfAH2/J8X8pLbqLNm7/MWnAIJuOVpZp06V7YFfN6eI8shjkU5Ul0qyJFURF8R8qVfs
	2yo26ifiFotNlhAu1Bmj+Xy+ocn6tzvmUA3wrVKIlG4P4tQQSkpVyX4bqdWK0FYvMd61HIza00K
	riqXQ38LUoH+FqpNIgMZwJn0of0fWFVbJ2XEL8p5gqydPHnMjVNAB6NC/JqRujwdDF+D7JGqUI9
	4T78vEDKSmubS4IxF/uBWJ9E4hVK0NlRVMUxyYvy4QDbPH4up4mSVCRLm/COpnLSFzHW
X-Google-Smtp-Source: AGHT+IFgnshRXYAm4vLgOrmgYGZWM8t1SObZHkSRdPxsGHvAJ5uKKQ60xC74a/vGxL92untQtleJTA==
X-Received: by 2002:a05:6a00:1306:b0:736:73ad:365b with SMTP id d2e1a72fcca58-73fd74c23c4mr7475320b3a.14.1745658881199;
        Sat, 26 Apr 2025 02:14:41 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e259412b2sm4594535b3a.66.2025.04.26.02.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 02:14:40 -0700 (PDT)
Date: Sat, 26 Apr 2025 17:14:29 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>, Yury Norov <yury.norov@gmail.com>
Cc: Yury Norov <yury.norov@gmail.com>, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	jk@ozlabs.org, joel@jms.id.au, eajames@linux.ibm.com,
	andrzej.hajda@intel.com, neil.armstrong@linaro.org,
	rfoss@kernel.org, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, dmitry.torokhov@gmail.com, mchehab@kernel.org,
	awalls@md.metrocast.net, hverkuil@xs4all.nl,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	louis.peens@corigine.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
	johannes@sipsolutions.net, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, akpm@linux-foundation.org, jdelvare@suse.com,
	linux@roeck-us.net, alexandre.belloni@bootlin.com, pgaj@cadence.com,
	alistair@popple.id.au, linux@rasmusvillemoes.dk,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, kuba@kernel.org,
	linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	oss-drivers@corigine.com, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
	bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw, Frank.Li@nxp.com,
	linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org,
	david.laight.linux@gmail.com, andrew.cooper3@citrix.com,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v4 00/13] Introduce parity_odd() and refactor redundant
 parity code
Message-ID: <aAyj9SMvYrN9tXZC@visitorckw-System-Product-Name>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <Z_amQp3gK5Dm8Qz3@yury>
 <Z/a5Qh/OeLT8JBS4@visitorckw-System-Product-Name>
 <Z_a9YpE46Xf8581l@yury>
 <e97a83a2-dabd-4dc3-b69a-840ca17d70b5@zytor.com>
 <Z/lEkDwefWvw4ZA3@visitorckw-System-Product-Name>
 <8571fd6f-4e71-4a6d-b2e8-16d9d72fa56e@zytor.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8571fd6f-4e71-4a6d-b2e8-16d9d72fa56e@zytor.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_021442_804910_F291F88C 
X-CRM114-Status: GOOD (  19.16  )
X-Mailman-Approved-At: Thu, 15 May 2025 02:17:28 -0700
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

On Fri, Apr 25, 2025 at 12:33:21PM -0700, H. Peter Anvin wrote:
> On 4/11/25 09:34, Kuan-Wei Chiu wrote:
> > > 
> > > In either case, instead of packing the cascade into one function, make good
> > > use of it.
> > > 
> > > In the latter case, __builtin_constant_p() isn't necessary as it puts the
> > > onus on the architecture to separate out const and non-const cases, if it
> > > matters -- which it doesn't if the architecture simply wants to use
> > > __builtin_parity:
> > > 
> > > #define parity8(x)  ((bool) __builtin_parity((u8)(x)))
> > > #define parity16(x) ((bool) __builtin_parity((u16)(x)))
> > > #define parity32(x) ((bool) __builtin_parity((u32)(x)))
> > > #define parity64(x) ((bool) __builtin_parityll((u64)(x)))
> > > 
> > > As stated before, I don't really see that the parity function itself would
> > > be very suitable for a generic helper, but if it were to, then using the
> > > "standard" macro construct for it would seem to be the better option.
> > > 
> > > (And I would be very much in favor of not open-coding the helper everywhere
> > > but to macroize it; effectively creating a C++ template equivalent. It is
> > > out of scope for this project, though.)
> > > 
> > IIUC, you prefer using the parity8/16/32/64() interface with
> > __builtin_parity(), regardless of whether there are users on the hot
> > path?
> 
> As a per-architecture opt-in, yes.
> 
I'd prefer to see Yury agree first, otherwise there's a high risk of a
maintainer NAK after the next submission.

Regards,
Kuan-Wei

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
