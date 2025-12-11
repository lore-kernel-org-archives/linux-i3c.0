Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B51D41D69
	for <linux-i3c@archiver.kernel.org>; Thu, 11 Dec 2025 16:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/7NoS5NWtrvAhEZjMm0Kt/MuS9q7v8gSl8e6Inn+uA0=; b=cH13WRUyGuHcay
	rtR+ogMQjQ+RXqE/H9s6eyBPvhltUBT7dZxBVrErrOwSgiPA8QdDJgrkRYP0x5pMkmvIlC2TXtX/2
	bu9YwLLirOfJvBn18dEsRC29h3Y0EN+F4NjsSGF7kWbcF3KKfblxTk+Px8nYnsx6q/EOZ9lbxhR0Y
	cGknc/ft8Js0ek7RfFEcvreQmvpIBbN+usnFYezZj2zh35OhJL3vO2QZLTtn13KSSP/tNGbK4JJYO
	HCgKeGnK2Xj8a9bK3XPNeAP3PeFz7DrZnzH7O9Zp5sNsvbqD/QrWwE1MeV3qKnO9EEfp/RUWkfd3l
	wsDLhSkzuF8cTU6sVtMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTjmV-0000000Gz8L-0IfS;
	Thu, 11 Dec 2025 16:44:43 +0000
Received: from mail-westeuropeazon11011053.outbound.protection.outlook.com ([52.101.70.53] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTjmR-0000000Gz7j-3wAu
	for linux-i3c@lists.infradead.org;
	Thu, 11 Dec 2025 16:44:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W3EgykfJHU3OP4x4YLAbdcMCjHWdxgVYY9pEj0N3j3nGWpn5G/rFIU7r3apS3boAQcZkz8ad49bxuN6ZQpOh39z/BOGxwABU8eGudhbkN/clDynB/qtvaQJpn3cpI7tDWs8Zje6gajagvz5cFIP84UinbXZcRDgWwknrpKVJ5+6SPvo4NJwPwZLxvWRil8PLChiBFKFEWE/mp3Iah01WiXv96+BzMh32zBetgHXrKEnvcTSobiQb35x9qADicx2+ZHUYJp2rOpLzhkPYn9gpI8ECo5XNIcTiITf4lOmd3GEzkipkMIyvySK/w0uE883qhOwLWTlsC4uH3NNpiE0mBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UKq/zOZxnE+KyIJcCEX7S6dZBMmUNtVcwUGBA97lHM8=;
 b=NkgXPJlOLrCHg+FgrOcxS4FqfiLAnmYGYuX3BtAAJ9Ymi9ZCgkx/SpBupEx6MxOu6wt5TgU1LirlIjF6SS5IOe7+LDzhSoSu1hUqJ/UoqnNncQ/CSpSEaPq+A/jB6sWduQ6PdhaeHGD+hqwXD2j3fxujHaMT8fgMjB6ZYWm9ioUNPFDdM0efXCvvrb4L1u5wansyyq8lZPkJdV3kCRcNt5FbxhMDvwbAJ4wTBVSrm0gJjcFi5kJkTExTYmXUHgeADWmrn+jJOLZ2FDmcB6SZrAfi2AZ40ml4Enf/Lf+TsMkxm72hN4KC/9YI/ZqelqzVwc2vbEomXe9Bz5bu7Ue08Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UKq/zOZxnE+KyIJcCEX7S6dZBMmUNtVcwUGBA97lHM8=;
 b=LaTAgih2ZZxDpDOAVr/c9IPtVRr6KMNrugr4ktDsMZP+fv08TliYwKbGIfS1SiJIRW5S4efmCrP4AUrI43VynyLjz8I2azEYEjrPIkGAezBFsdbx2V2wiYP99h+XfhuHiTDNhcO0kr+jPpxC1BXuakUzES48wtyJY0QZ9EXRm36lTZ0hcZDYhqCnZ+6ENpRpLQy1ajyXDvIZFAnvaY/iXItautUDqZko6sPaQq1dSl7s/GK4xkx/5C+lkCyiYdo9LNhZb6xSwq+evtxqYu7V990Zz5KsOoayi47FUh+CsBF2v/1pkWcWrtRu83zUhfocpzGggOyFMHGgY145jOcKZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by VI2PR04MB11193.eurprd04.prod.outlook.com (2603:10a6:800:291::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 11 Dec
 2025 16:44:34 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 16:44:34 +0000
Date: Thu, 11 Dec 2025 11:44:28 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V2 09/10] i3c: mipi-i3c-hci-pci: Add support for
 Multi-Bus Instances
Message-ID: <aTr07CVVD0YSN4Ax@lizhi-Precision-Tower-5810>
References: <20251211134809.75872-1-adrian.hunter@intel.com>
 <20251211134809.75872-10-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251211134809.75872-10-adrian.hunter@intel.com>
X-ClientProxiedBy: PH0PR07CA0013.namprd07.prod.outlook.com
 (2603:10b6:510:5::18) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|VI2PR04MB11193:EE_
X-MS-Office365-Filtering-Correlation-Id: ef54f3f7-8559-4514-1148-08de38d49085
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4hoAGDrFgLwI6EAL4NJzId10lQ9lwIk2d+suSkWye1Safm5PP8WAaPAKWU54?=
 =?us-ascii?Q?RMDrdvbbXVU74q9FavRw8fIA03Mwhv/DoYj0xMJ3mPp64llz6gqW9xwdSfed?=
 =?us-ascii?Q?/+MZ/08cQTPa/ybOethJxksFE2cu+HgTOiEdTA/Al3l/oo0ey34liJh9pJiV?=
 =?us-ascii?Q?ZNITPli+nrVbSlFOGmjByW3iPgSJjjVM8nTT7ES9FzzeJG+GiawzYFO9vbdh?=
 =?us-ascii?Q?FO2TxgNR57iMpuVnt6J3Up46nmMRxhg07bdmBteyU2H8+v2OkIOJe64yE9Wl?=
 =?us-ascii?Q?FiG2drd3EJWiHKq/J0DDnx82/1867pnWsWkwtKglYH2XuFGFrt2a0FfeiJMQ?=
 =?us-ascii?Q?q9ngDV6LgrZRfMGtCYKf71zQ1VkZ9PituLwd5zU8ye8xBKGBvCOvQD6O40bH?=
 =?us-ascii?Q?NnnSNbM51Md8zMyNXfTDLHU17HLkTeCVf+Kcn/Bq8t0kYX8jO9Dlsa6LlTZo?=
 =?us-ascii?Q?I/37MUUt2kkANAxvpF2go6GEDcPnFFCK34Bpd6FQLOxc3eISWN5Wmg8Al5zu?=
 =?us-ascii?Q?NfpnpTb+c3VGjkM9Hhpr5K4eajdTsRIRM2tvcQtAXqMFf95iXCXAPxj2aRDr?=
 =?us-ascii?Q?BDQQnWC4ZJjwmfMILy/eIKGyrFbOBAv8hTWLLLpsTF4Qd85OXIFURQCq1SS7?=
 =?us-ascii?Q?lI2SyHRF73x9qo00N9mM+VYSqnmV9D50LobXsevxLWUiizuTEmwHWwrlOhQ6?=
 =?us-ascii?Q?qTIf0/+3w1f8Q1S7zHm0VGA2X7eOwqy5Lc7zs/jLXdffOE6ZEBMd+vrJFhMj?=
 =?us-ascii?Q?NvyHahn80nBow+YbrhT2Cf9I6n5JbqZdmxn7IumLzURsnKo2ZeQB0JbY/LP0?=
 =?us-ascii?Q?OB3lVXCQvOhIN1G+Ab8AeKx5/cbLVzJ8tylKmK5BvP3aa4eU87T1Y5BrYZPk?=
 =?us-ascii?Q?Jz6tb1Q9dQbQ32OCXv9QJ7NG4pkUQU51vOdlOoPFznwaGU8unSns3Ygyn3Bs?=
 =?us-ascii?Q?zvQp+AXG9xNS5E7xUenjamAKlLNcjZXKu47nWNwcpUJqc2j7WYOBmeeaZQqH?=
 =?us-ascii?Q?G1CH/4cmWkttiFNg8w9kRRAG/A8+2r+bgA2rOo1iO02Ms8E1YeNrnZPKjH6y?=
 =?us-ascii?Q?orr7zTJBTgmr8jTHkPuq8gowQPler3nDbwfUFNYF0XNujXoUKlRQNl53fgir?=
 =?us-ascii?Q?jeT9KvJhsA4uohUWJqXeOf2PkNtIeYV0Pmxz9AMxEOsOxt37xuF0N2d0ZHj8?=
 =?us-ascii?Q?8p92AOsE8F2PkxY8PVbAtqCZ2iVShNfr1WTlyi/zZU/6LqiSOz2sT5Rm8/uj?=
 =?us-ascii?Q?9KIgTLBfmwhv+Nflb5BnCGrxGoTHV8TPNNEr1u9Ix5fRhyKBI9FCRwbokFRu?=
 =?us-ascii?Q?3jWbSmIUtKaBntJ15kXs094CiKfAp9B24hZgfyMvk765geT2kl7YoAQaG0kR?=
 =?us-ascii?Q?CCsKP4XTAlAhsp8EfYG2UKc/HcosKGKLyYEehIomyYHsXiKZLjzkYIB72q+c?=
 =?us-ascii?Q?YbPRj/WkL6/9o4LCNH66yr7bcdC+fSGjrADH3/E2jm74fqufca6okJ528V8A?=
 =?us-ascii?Q?/QfgFWCY5SuJ23TM0G2MzZTGd+BHBjebPvx0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7FvnOaYhSPKP9NmkhLnDBKftmP4LlXD7p/1M7rpMaeZ2LYT8ft78vPrTMmX2?=
 =?us-ascii?Q?q5d6o9qqCHCVGxHoGPfNAb/GAoQR2/eDormpjHdnMNao2v2UVevjjHiJvEts?=
 =?us-ascii?Q?i2eas3vM19/1dnjhBsbDAH5iUV6ZOZp4UMIF1t1iBzCxXv2VPLUa3zV2rYu6?=
 =?us-ascii?Q?WfQy6xzv8A2KJw+VjX0ihMaZaAIiv/6PfyD6HADqpPKV9VAwptWPby+7rIsv?=
 =?us-ascii?Q?N/jARDSvDaOLuOZf4JdQkqSGOh8LFBnA936FK/+5uc2cNJHPumG8jUk1knPE?=
 =?us-ascii?Q?mvYjdELxm4jzAd8Y7woMchC/9iSWDgw4kmM5KuQBC1de3hNfAdZTaVMn7D1/?=
 =?us-ascii?Q?O9gAS0mOTQtGB/d0yIkqYn7hYgAIZUpMFE4OdH7Pc6lWky4ElHuLVMR3YB17?=
 =?us-ascii?Q?4ZUTTAkdEybK30KVCruRHsBt4aKgbe4a9QZIzVDG6Uti328agNa7IHyh+SFd?=
 =?us-ascii?Q?JoW6uxOfw8orSDB97NeVdbUJfEMBI48L4PgSYEObX/cnhLZ81GYvDMQTkJMV?=
 =?us-ascii?Q?mH/n3dlmrtKv+WoNFY+MjAp0+ljZcFX2Manpxjw59CfiA7TKfUZYWoMsi9cx?=
 =?us-ascii?Q?R6sEQdGX1pQDqiX8SxeeEXek7hQMJlmYrNCxlHEsfk3wNUtkMPI/ZYaIycnH?=
 =?us-ascii?Q?s0CWQgfiw/zZojRKN06RKRPCM4OcYf9RJ2h4ZT4AxUCBluJXlzDAeLeN4aCB?=
 =?us-ascii?Q?vFwZRmNFQlOaCbiyPPYAfZWDqJFGwK8CRW4bpMb1eyeNNNHdpIsOq2DJKlHH?=
 =?us-ascii?Q?FSBWuUD3PIf0+gpllEt/zfvuCtbH5ng0HAjWbCERgpEs2F5Q2gXFjYKN6y6L?=
 =?us-ascii?Q?hf4ZV1NKP3eD6APKgyR82Z3rXvk2BK2BBnGuAzKWkIkGDAoQQ29o7bNvM+7c?=
 =?us-ascii?Q?yWFThdywrtG+tBZi1Oum1GbOdwGUy784X6YxuFa9zZGIyAisogw1TAp+/W7l?=
 =?us-ascii?Q?TTf5uhdSihpLuUOum/NeH7dre025XDZZoLplXtWLUooJxBIiOjPt5sqDIwVU?=
 =?us-ascii?Q?B8QUpLb/Stw8iXaVdwWiaJhrQaX8+4cv2D8SuYkrRX/WReIwaguM9Yp7bvRw?=
 =?us-ascii?Q?hgEJ4TUTxBsaSznGvfi6jBWrnTu9TpFKA9nrEv60I9JXtMnzoOn0q/jcOzGN?=
 =?us-ascii?Q?wF/Z4IPkBhBtnqm8LHjHJ0MRfOvB4cDvKdzdE2VlDHDNhGEoRW7ggLaQ4ZAg?=
 =?us-ascii?Q?Hk5gHNrxtzmX9w+u4Z69//TZlqaQYnzQ7AJXb6ijxWvsyy81QNXJikAAU0os?=
 =?us-ascii?Q?jlnxVh8PMDPyfBEJVv83jw09dX++3lDnAs8+zHdu02Z8xnEiIzvH3fXJsImU?=
 =?us-ascii?Q?898bYgyHD4OwsM9h3Y8e0/0IWAYQYANonjYwTeuCxU1Bpj7dOd2mLsrUYuCn?=
 =?us-ascii?Q?fpVzL5Rfl4uNLBc1h3Pm6QvMB4ojA/PtZx+v5haKBbU29bSTK6/Yyot/Z/IE?=
 =?us-ascii?Q?6PlRVeSlKDA7uL0Hyv5ArMSQl01O1+iQMGWhnd6RpCnvyVHGF14SlEihGIbe?=
 =?us-ascii?Q?BkOOzPtl4e+q2REbysCqAL1otM4KhOEyNIzbZnvE///Lza9pC2KRary4vdjU?=
 =?us-ascii?Q?H1Zh+EASlqsgjva3qK49Mh7JReL/ydfavD8vzQNA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef54f3f7-8559-4514-1148-08de38d49085
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 16:44:34.3331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7QvLnZzC3uT3IDkMuvsmk67bVqx+pFnaAWSSIo1Utz8bfdrbdrUcoIrlS2YCdPzbA+rNgtEoA5W8KXLjmiGsWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11193
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_084440_138683_E5371468 
X-CRM114-Status: GOOD (  33.01  )
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

On Thu, Dec 11, 2025 at 03:48:08PM +0200, Adrian Hunter wrote:
> A MIPI I3C Host Controller with the Multi-Bus Instance capability supports
> multiple I3C Buses (up to 15).
with single hardware function (e.g. PCIe B/D/F).

...
> with one instance of the HCI Register Set
> and one instance of I3C Bus Controller Logic for each I3C Bus, in a single
> hardware function (e.g. PCIe B/D/F).

Each I3C bus have indepedent HCI register space and I3C Bus controller logic.

>
> Create an MFD cell for each instance.  Use platform_data to pass the
> instance's register set start address.
>
> MIPI I3C specification defines an Extended Capability to hold the offset
> of each instance register set.  However parsing to find that information is
> relatively complicated compared with just including it in the driver data.
> Do that for now.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>
>
> Changes in V2:
> 	Conversion to MFD split into separate patch
> 	Simplify ID allocation / free
> 	Correct use of __free()
> 	Also define instance 0 in driver_data
>
>
>  .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 63 +++++++++++++++----
>  1 file changed, 50 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> index 68088967942b..de1f71763786 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> @@ -19,10 +19,17 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_qos.h>
>
> +/*
> + * There can up to 15 instances, but implementations have at most 2 at this
> + * time.
> + */
> +#define INST_MAX 2
> +
>  struct mipi_i3c_hci_pci {
>  	struct pci_dev *pci;
>  	void __iomem *base;
> -	int dev_id;
> +	int dev_id[INST_MAX];
> +	int dev_id_cnt;
>  	const struct mipi_i3c_hci_pci_info *info;
>  	void *private;
>  };
> @@ -30,6 +37,8 @@ struct mipi_i3c_hci_pci {
>  struct mipi_i3c_hci_pci_info {
>  	int (*init)(struct mipi_i3c_hci_pci *hci);
>  	void (*exit)(struct mipi_i3c_hci_pci *hci);
> +	u32 instance_offset[INST_MAX];
> +	int instance_count;
>  };
>
>  static DEFINE_IDA(mipi_i3c_hci_pci_ida);
> @@ -177,53 +186,81 @@ static void intel_i3c_exit(struct mipi_i3c_hci_pci *hci)
>  static const struct mipi_i3c_hci_pci_info intel_info = {
>  	.init = intel_i3c_init,
>  	.exit = intel_i3c_exit,
> +	.instance_offset = {0},
> +	.instance_count = 1,

just one instance? suppose at least 2, otherwise, not need this patch.

>  };
>
> +static void mipi_i3c_hci_pci_free_ids(struct mipi_i3c_hci_pci *hci)
> +{
> +	for (int i = 0; i < hci->dev_id_cnt; i++)
> +		ida_free(&mipi_i3c_hci_pci_ida, hci->dev_id[i]);
> +}
> +
> +static int mipi_i3c_hci_pci_alloc_ids(struct mipi_i3c_hci_pci *hci, int nr)
> +{
> +	for (int i = 0; i < nr; i++) {
> +		hci->dev_id[i] = ida_alloc(&mipi_i3c_hci_pci_ida, GFP_KERNEL);
> +		if (hci->dev_id[i]  < 0)
> +			goto err_free_ids;
> +		hci->dev_id_cnt = i + 1;
> +	}
> +
> +	return 0;
> +
> +err_free_ids:
> +	mipi_i3c_hci_pci_free_ids(hci);
> +	return -ENOMEM;

You have to handle ida error, actually, it makes not big difference with
mfd and add multi platform devices.

> +}
> +
>  struct mipi_i3c_hci_pci_cell_data {
>  	struct mipi_i3c_hci_platform_data pdata;
>  	struct resource res;
>  };
>
> -static void mipi_i3c_hci_pci_setup_cell(struct mipi_i3c_hci_pci *hci,
> +static void mipi_i3c_hci_pci_setup_cell(struct mipi_i3c_hci_pci *hci, int idx,
>  					struct mipi_i3c_hci_pci_cell_data *data,
>  					struct mfd_cell *cell)
>  {
> -	data->pdata.base_regs = hci->base;
> +	data->pdata.base_regs = hci->base + hci->info->instance_offset[idx];
>
>  	data->res = DEFINE_RES_IRQ(0);
>
>  	cell->name = "mipi-i3c-hci";
> -	cell->id = hci->dev_id;
> +	cell->id = hci->dev_id[idx];
>  	cell->platform_data = &data->pdata;
>  	cell->pdata_size = sizeof(data->pdata);
>  	cell->num_resources = 1;
>  	cell->resources = &data->res;
>  }
>
> +#define mipi_i3c_hci_pci_alloc(x) kcalloc(hci->info->instance_count, sizeof(*(x)), GFP_KERNEL)
> +

It is not good to hide hci in macro.

mipi_i3c_hci_pci_alloc(hci, x); or
mipi_i3c_hci_pci_alloc(nr, x)

>  static int mipi_i3c_hci_pci_add_instances(struct mipi_i3c_hci_pci *hci)
>  {
> -	struct mipi_i3c_hci_pci_cell_data *data __free(kfree) = kzalloc(sizeof(*data), GFP_KERNEL);
> -	struct mfd_cell *cells __free(kfree) = kzalloc(sizeof(*cells), GFP_KERNEL);
> +	struct mipi_i3c_hci_pci_cell_data *data __free(kfree) = mipi_i3c_hci_pci_alloc(data);
> +	struct mfd_cell *cells __free(kfree) = mipi_i3c_hci_pci_alloc(cells);
>  	int irq = pci_irq_vector(hci->pci, 0);
> +	int nr = hci->info->instance_count;
>  	int ret;
>
>  	if (!cells || !data)
>  		return -ENOMEM;
>
> -	hci->dev_id = ida_alloc(&mipi_i3c_hci_pci_ida, GFP_KERNEL);
> -	if (hci->dev_id < 0)
> -		return hci->dev_id;
> +	ret = mipi_i3c_hci_pci_alloc_ids(hci, nr);
> +	if (ret)
> +		return ret;
>
> -	mipi_i3c_hci_pci_setup_cell(hci, data, cells);
> +	for (int i = 0; i < nr; i++)
> +		mipi_i3c_hci_pci_setup_cell(hci, i, data + i, cells + i);
>
> -	ret = mfd_add_devices(&hci->pci->dev, 0, cells, 1, NULL, irq, NULL);
> +	ret = mfd_add_devices(&hci->pci->dev, 0, cells, nr, NULL, irq, NULL);
>  	if (ret)
>  		goto err_free_ids;
>
>  	return 0;
>
>  err_free_ids:
> -	ida_free(&mipi_i3c_hci_pci_ida, hci->dev_id);
> +	mipi_i3c_hci_pci_free_ids(hci);
>  	return ret;
>  }
>
> @@ -281,7 +318,7 @@ static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
>  		hci->info->exit(hci);
>
>  	mfd_remove_devices(&pci->dev);
> -	ida_free(&mipi_i3c_hci_pci_ida, hci->dev_id);
> +	mipi_i3c_hci_pci_free_ids(hci);
>  }
>
>  static const struct pci_device_id mipi_i3c_hci_pci_devices[] = {
> --
> 2.51.0
>
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
