Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F06C83F15
	for <linux-i3c@archiver.kernel.org>; Wed,  2 Jul 2025 22:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ensuWLOA5UJdRWC6obIJeOAwasknsc3PXKWhl03MzPk=; b=sY6oj/Tb8PPC+T
	QB8cBQ1KSlzXVUOaAnxG7N8rOEMF18IQ0VukWB6/YS+h6XNYcs20X1r08taeUgEt2LDm0RrDy7Hit
	6zeFjYlFYhHOPej3MmYulonKl1lpv4ZMzSbo1XCoIKp9SwluiIqtcACj2CQZmkd1XF64VNr2kY3T0
	dXm+MQeWh/xy4CQ/ZPQOn7wQvQOV9Pm+AE7le1XZsfQvyBPOUSKSObJUAzJdfh9ULnOabPL9LOZ05
	QxwR7rSSIzjKm+SUsmJKS7GZP0DdMe2mShs3J8zcI5MVaNmcv1H/yh04VNyg5JsTiqYjIGK0FLmWs
	37zNoXhMlih1gO1vJHPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX5bY-00000009fCV-1zs9;
	Wed, 02 Jul 2025 22:07:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWyLN-00000008cFb-400P
	for linux-i3c@bombadil.infradead.org;
	Wed, 02 Jul 2025 14:21:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QoqW7uLmIq5o6ktQqYTPztNvgZ7wz4g3kzg+DnBETgM=; b=P0UOZFrRP6BNniR7rdQPMz0O7y
	sKoWh+7sf7iL7qPyZMUdOdkXiplfZ62zRM/7FAcaAjE6WBlhdwv1kl9fsqG7jXJ6G7EiUNI5XT7f6
	vZam6+deU2QMcW4TJK+LUHt9fYsB1qN0NjJt/NHlwzitqJeTrtP3x1ffwJI4gkPlDocwlZ9MT6NWS
	nS/1zZgt8xWtw7+09E1v93SNXi+gRxAX6VmMtXFEy1hQrZ2Alg9f4qWL0aqhE6N1B+MziW7HfgKg/
	tYjuEYoDcijjNTIbLASzlB+lXXEAyaptInREnofTRAxmEz1dEAMagO4az1rUgffSVdpdHHFk/Z6Fd
	uIKeFALA==;
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWyLK-00000007Rcl-2sKu
	for linux-i3c@lists.infradead.org;
	Wed, 02 Jul 2025 14:21:48 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b350704f506so2882738a12.0
        for <linux-i3c@lists.infradead.org>; Wed, 02 Jul 2025 07:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751466104; x=1752070904; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QoqW7uLmIq5o6ktQqYTPztNvgZ7wz4g3kzg+DnBETgM=;
        b=Q9Z2bekcLs1t56vQyKvz/0nUqZbAVIi5qJlsji5eBoMbPAABm9qhbLKs0wzbw83jlR
         248UgYTZCsqAIBz5O7YH/iRRPfisEbk5PAFhH4XYIW6DpiLzMn0CYAQVFPNNgbyBRVKB
         7IIYRbirjVNQWkF7u+yug0M0JyYbot35ubTeeDxBej2YJudbmqA4a1lfuNoiQI8SlAzj
         dNY+ta5WLT8KC8TyVhs9l0B893lUl5mvY3zojstoaj/gMUz4McTpPKeBs1zQHeeTvcJ/
         EnVApYnUarU5HPwGMepHwy2/euzZAkjyjeycWFSN6vLqIp+BQnRJYO/2G6Ac2Onbf6tH
         kLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751466104; x=1752070904;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QoqW7uLmIq5o6ktQqYTPztNvgZ7wz4g3kzg+DnBETgM=;
        b=wBIl5pLfp5S2gMUQmfnuJZTqESeNcZVL0u/amIZD2izmY10DARfszEXl/Gix/NqC8b
         nZo9YzZqCl4AhdYKwLNeCDtrOgHiE+XGuWPPpIYldkKN7qGlQeIwEOlP1VKicqNUA+ci
         CYpH9YQ/zAbHvzF2OtSa8mHnVLR9JQaEZt3DmLDVQEacweyQgpJkDV7Qc/E3xdZIri+O
         FG1+Bcd5pcSXzs6BSQFsWlaofZJ0HzFM/GV3jY3WwHZRNaREOIwmaKgtbkGPXu9JYJoa
         ERUSXSO/2mRn2aMzCa71VnjwEB9QLMetqRULRhieA5DHhWFwwxpLfwRjRmd5lN00R49c
         of8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVvEBPkvMOnMbQXFMbwGLe2oXPcVihDUuU1k28wnYo6nPRQc+3oG3GBrFLm63puAlAHHUWN/pDhtHI=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywyl8q4h0NO2+SB9pFCDAWaPLOZlRXAyKsI0aqqmlmgvR3DZLhj
	eWZ5ahnTlxjClsAoKJG5qWfy9AwU89Tvib+9GGoW10CrVewY7XORSwrD
X-Gm-Gg: ASbGncsSsNPzEyaecFqqdoI1bvBhJouBgif8+S4Adban85kmLuJhFY59MLGcReLGWSz
	kgazHBIJ5B1yd5EWIYP+Z5MHQPgy4UtinlkpQIWz/r9Ca+822DtbdZ6yebBWpyw8MBTB4tIDe0a
	GK2Dn1eeynKiZQcLWopwFK6dwq0Noo9Jrjrqweg4gmCjdGcS53PM2pIvXPdY48Wow/5tKsNnM4H
	dAIUvJIvQdb0KbyHbmehYH4ypczduqmMGCgvMqoXrJPrqkmFBYh59wG37BjL/J2GvfLiPAlpR/Y
	K3DNbwuoQqjUAFl+5l49rWfxMCvBzCVu8sSVH3et2beMeddImZH9YAwcrC6WSJczUAjsXA==
X-Google-Smtp-Source: AGHT+IEmEnGhey284f0Ong/chQehRAPRbLYx7zppPrcRzIt0TBFHenlyZKlI15FaEUWNu/0352DJ9w==
X-Received: by 2002:a05:6a20:6a04:b0:220:42a0:7f65 with SMTP id adf61e73a8af0-222ed67fb94mr4237330637.17.1751466103842;
        Wed, 02 Jul 2025 07:21:43 -0700 (PDT)
Received: from localhost ([2804:30c:b15:b200:425a:de22:1d7f:2d4b])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74af557591asm14803960b3a.99.2025.07.02.07.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 07:21:42 -0700 (PDT)
Date: Wed, 2 Jul 2025 11:23:43 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Jorge Marques <gastmaier@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Jorge Marques <jorge.marques@analog.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: i3c: Add adi-i3c-master
Message-ID: <aGVA779eeNZ0zWsa@debian-BULLSEYE-live-builder-AMD64>
References: <20250626-adi-i3c-master-v4-0-3846a1f66d5e@analog.com>
 <20250626-adi-i3c-master-v4-1-3846a1f66d5e@analog.com>
 <20250627-steadfast-ferret-of-expertise-5c8ff2@krzk-bin>
 <tl5fckhrivaqfyzwyb2o2a7gykpigwend7z2nduqgbbej3hqbs@vxxtsadhtdmt>
 <41782ded-908b-46ef-8f75-4d2565476b7c@kernel.org>
 <cfi6rzhco2ba6pcbk57l7tblimuks5jnpgaly7nbedbrpyhtma@u46if22kurwk>
 <v2ybju75bpjdqxfkell47nlkeyal36ylmnqt2yvpncxnmp2irb@pygx56jsyxkr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <v2ybju75bpjdqxfkell47nlkeyal36ylmnqt2yvpncxnmp2irb@pygx56jsyxkr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_152146_822623_343663BC 
X-CRM114-Status: GOOD (  23.31  )
X-Mailman-Approved-At: Wed, 02 Jul 2025 15:04:02 -0700
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

Hello,

On 07/02, Jorge Marques wrote:
> On Fri, Jun 27, 2025 at 06:02:26PM +0200, Jorge Marques wrote:
> > On Fri, Jun 27, 2025 at 04:49:19PM +0200, Krzysztof Kozlowski wrote:
> > > On 27/06/2025 16:38, Jorge Marques wrote:
> > > > On Fri, Jun 27, 2025 at 08:56:55AM +0200, Krzysztof Kozlowski wrote:
> > > >> On Thu, Jun 26, 2025 at 12:07:36PM +0200, Jorge Marques wrote:
> > > >>> Add bindings doc for ADI I3C Controller IP core, a FPGA synthesizable IP
> > > >>> core that implements the MIPI I3C Basic controller specification.
> > > >>
...
> 
> I went after the reason of the historically -1.00.a suffix and
> discovered that they came into existence due to AMD Xilinx auto
> generation devicetree tool SDTGen
> https://github.com/Xilinx/system-device-tree-xlnx
> that would automatically suffix with the IP version, defaulting to 1.00.a,
> and for a seamless experience, the were copied over to the dt-bindings.
> 
> The adi,axi-pwmgen dt-binding went more creative and suffixed with
> -2.00.a, while never enforcing Vivado to yield the devicetree with such
> value (Major version is asserted in the driver through reg access, the
> current core version is v2.1.1)
> 
> Testing on my side (AMD Xilinx Vivado 2024.2), it seems Vivado now
> defaults to 1.0, so the previous bindings from the other IPs are not
> accurate anymore, either, (axi-pwmgen auto gens
> `compatible = "xlnx,axi-pwm-gen-1.0";` (`xlnx` instead of `adi`, also)).
> 
> For fun, the current Vivado version thinks the devicetree node for the
> i3c master should be as follows:
> 
>   i3c_host_interface: i3c_controller_host_interface@44a00000 {
>           compatible = "xlnx,i3c-controller-host-interface-1.0";
>           reg = <0x44a00000 0x10000>;
>           clocks = <&clkc 15>;
>           clock-names = "s_axi_aclk";
>   };
> 
> Let me know if we can drop the suffix, or replace with something else.
> The current register defined core version is v0.1.0.

I have no say in how dt-bindings should be, but having the IP version number
automatically generated doesn't sound like a sane thing to do IMHO. Maybe try to
standardize with -1.00.a suffix? Though one could also argue about dropping such
suffixes. Since we were told that the convention is to have the file name to
follow the compatible, I would go with 'xlnx,i3c-controller-host-interface'
(without any suffix) so the file name is smaller and clearer IMHO. dt maintainers
might prefer that in a different way.

Best regards,
Marcelo

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
